#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true

# Kernel
TARGET_KERNEL_DTBO_TARGET_PREFIX := dts/
TARGET_KERNEL_DTBO_TARGET := google/dtbo.img
TARGET_KERNEL_DTB_TARGET := \
    google/gs101-a0.dtb \
    google/gs101-b0.dtb
TARGET_KERNEL_SOURCE := kernel/google/raviole

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat device/google/raviole/vendor_dlkm.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat device/google/raviole/vendor_boot.modules.load))

TARGET_EXTERNAL_MODULES := \
    kernel/google/raviole-modules/display/samsung \
    kernel/google/raviole-modules/wlan/bcmdhd43752 \
    kernel/google/raviole-modules/wlan/bcmdhd4389 \
    kernel/google/raviole-modules/gpu/mali_pixel \
    kernel/google/raviole-modules/gpu/mali_kbase \
    kernel/google/raviole-modules/lwis \
    kernel/google/raviole-modules/edgetpu/drivers/edgetpu \
    kernel/google/raviole-modules/bms \
    kernel/google/raviole-modules/amplifiers/drv2624 \
    kernel/google/raviole-modules/amplifiers/cs40l25 \
    kernel/google/raviole-modules/amplifiers/cs35l41 \
    kernel/google/raviole-modules/amplifiers/audiometrics \
    kernel/google/raviole-modules/aoc \
    kernel/google/raviole-modules/aoc/alsa \
    kernel/google/raviole-modules/aoc/usb \
    kernel/google/raviole-modules/touch/common \
    kernel/google/raviole-modules/touch/fts/ftm5 \
    kernel/google/raviole-modules/touch/sec \
    kernel/google/raviole-modules/power/reset \
    kernel/google/raviole-modules/bluetooth/broadcom \
    kernel/google/raviole-modules/nfc \
    kernel/google/raviole-modules/uwb/kernel

# Manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
