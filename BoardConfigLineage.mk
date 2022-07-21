#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true

# Kernel
TARGET_KERNEL_DTBO_PREFIX := dts/
TARGET_KERNEL_DTBO := google/dtbo.img
TARGET_KERNEL_DTB := \
    google/gs101-a0.dtb \
    google/gs101-b0.dtb
TARGET_KERNEL_SOURCE := kernel/google/raviole/kernel

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat device/google/raviole/vendor_dlkm.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat device/google/raviole/vendor_boot.modules.load))

TARGET_KERNEL_EXT_MODULE_ROOT := kernel/google/raviole/google-modules
TARGET_KERNEL_EXT_MODULES := \
    display/samsung \
    wlan/bcmdhd43752 \
    wlan/bcmdhd4389 \
    gpu/mali_pixel \
    gpu/mali_kbase \
    lwis \
    edgetpu/drivers/edgetpu \
    bms \
    amplifiers/drv2624 \
    amplifiers/cs40l25 \
    amplifiers/cs35l41 \
    amplifiers/audiometrics \
    aoc \
    aoc/alsa \
    aoc/usb \
    touch/common \
    touch/fts/ftm5 \
    touch/sec \
    power/reset \
    bluetooth/broadcom \
    nfc \
    uwb/kernel

# Manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
