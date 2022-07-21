#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true

BOARD_KERNEL_IMAGE_NAME := Image.lz4
TARGET_KERNEL_ADDITIONAL_FLAGS := LLVM=1
TARGET_KERNEL_CONFIG := raviole_defconfig
TARGET_NEEDS_DTBOIMAGE := true
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-
TARGET_KERNEL_ARCH := arm64

# Kernel
TARGET_KERNEL_SOURCE := kernel/google/raviole

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
