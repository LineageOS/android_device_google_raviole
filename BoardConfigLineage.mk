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
TARGET_KERNEL_SOURCE := kernel/google/raviole

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat device/google/raviole/vendor_dlkm.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat device/google/raviole/vendor_boot.modules.load))

TARGET_EXTERNAL_KERNEL_MODULES := \
    kernel/google/raviole/google-modules/display/samsung \
    kernel/google/raviole/google-modules/wlan/bcmdhd43752 \
    kernel/google/raviole/google-modules/wlan/bcmdhd4389 \
    kernel/google/raviole/google-modules/gpu/mali_pixel \
    kernel/google/raviole/google-modules/gpu/mali_kbase \
    kernel/google/raviole/google-modules/lwis \
    kernel/google/raviole/google-modules/edgetpu/drivers/edgetpu \
    kernel/google/raviole/google-modules/bms \
    kernel/google/raviole/google-modules/amplifiers/drv2624 \
    kernel/google/raviole/google-modules/amplifiers/cs40l25 \
    kernel/google/raviole/google-modules/amplifiers/cs35l41 \
    kernel/google/raviole/google-modules/amplifiers/audiometrics \
    kernel/google/raviole/google-modules/aoc \
    kernel/google/raviole/google-modules/aoc/alsa \
    kernel/google/raviole/google-modules/aoc/usb \
    kernel/google/raviole/google-modules/touch/common \
    kernel/google/raviole/google-modules/touch/fts/ftm5 \
    kernel/google/raviole/google-modules/touch/sec \
    kernel/google/raviole/google-modules/power/reset \
    kernel/google/raviole/google-modules/bluetooth/broadcom \
    kernel/google/raviole/google-modules/nfc \
    kernel/google/raviole/google-modules/uwb/kernel

# Manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
