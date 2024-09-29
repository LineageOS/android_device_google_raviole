#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=raven
VENDOR=google

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

ONLY_FIRMWARE=
KANG=
SECTION=
CARRIER_SKIP_FILES=()
VENDOR_SKIP_FILES=()

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        --only-firmware)
            ONLY_FIRMWARE=true
            ;;
        -n | --no-cleanup)
            CLEAN_VENDOR=false
            ;;
        -k | --kang)
            KANG="--kang"
            ;;
        -s | --section)
            SECTION="${2}"
            shift
            CLEAN_VENDOR=false
            ;;
        *)
            SRC="${1}"
            ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        vendor/etc/init/init.modem_logging_control.rc)
            [ "$2" = "" ] && return 0
            sed -i 's/ && property:ro.debuggable=0//' "${2}"
            ;;
        *)
            return 1
            ;;
    esac

    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

function prepare_firmware() {
    if [ "${SRC}" != "adb" ]; then
        bash "${ANDROID_ROOT}"/lineage/scripts/pixel/prepare-firmware.sh "${DEVICE}" "${SRC}"
    fi
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

if [ -z "${ONLY_FIRMWARE}" ]; then
    extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

    generate_prop_list_from_image "product.img" "${MY_DIR}/proprietary-files-carriersettings.txt" CARRIER_SKIP_FILES carriersettings
    extract "${MY_DIR}/proprietary-files-carriersettings.txt" "${SRC}" "${KANG}" --section "${SECTION}"

    readarray -t VENDOR_SKIP_FILES < <(cat "${MY_DIR}/skip-files-vendor.txt" | sed -E "/^[[:blank:]]*(#|$)/d")
    VENDOR_TXT="${MY_DIR}/proprietary-files-vendor.txt"
    generate_prop_list_from_image "vendor.img" "${VENDOR_TXT}" VENDOR_SKIP_FILES

    # flp.default & gps.default have incorrect SONAME
    # libExynosC2*Dec & libExynosC2*Enc depend on libacryl & libexynosv4l2, which are gnu makefile targets
    set_disable_checkelf "vendor/lib/libExynosC2H263Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2H263Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2H264Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2H264Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2HevcDec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2HevcEnc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2Mpeg4Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2Mpeg4Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2Vp8Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2Vp8Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2Vp9Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib/libExynosC2Vp9Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/hw/flp.default.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/hw/gps.default.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2H263Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2H263Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2H264Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2H264Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2HevcDec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2HevcEnc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2Mpeg4Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2Mpeg4Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2Vp8Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2Vp8Enc.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2Vp9Dec.so" "${VENDOR_TXT}"
    set_disable_checkelf "vendor/lib64/libExynosC2Vp9Enc.so" "${VENDOR_TXT}"

    set_module_suffix "vendor/lib/com.google.edgetpu_app_service-V3-ndk.so" "-vendor" "${VENDOR_TXT}"
    set_module_suffix "vendor/lib64/com.google.edgetpu_app_service-V3-ndk.so" "-vendor" "${VENDOR_TXT}"
    set_module_suffix "vendor/lib64/com.google.edgetpu_vendor_service-V2-ndk.so" "-vendor" "${VENDOR_TXT}"

    extract "${MY_DIR}/proprietary-files-vendor.txt" "${SRC}" "${KANG}" --section "${SECTION}"
fi

if [ -z "${SECTION}" ]; then
    extract_firmware "${MY_DIR}/proprietary-firmware.txt" "${SRC}"
fi

"${MY_DIR}/setup-makefiles.sh"
