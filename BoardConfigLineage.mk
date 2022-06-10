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

# Manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
