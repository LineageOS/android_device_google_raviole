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
TARGET_KERNEL_SOURCE := private/gs-google

# GKI
TARGET_EXTERNAL_MODULES := \
    private/google-modules/nfc \
    private/google-modules/nfc/ese \
    private/google-modules/display/samsung \
    private/google-modules/uwb/kernel \
    private/google-modules/gpu/mali_kbase \
    private/google-modules/gpu/mali_pixel \
    private/google-modules/lwis \
    private/google-modules/edgetpu/drivers/edgetpu \
    private/google-modules/touch/common \
    private/google-modules/touch/sec \
    private/google-modules/touch/fts/ftm5 \
    private/google-modules/fingerprint/fpc \
    private/google-modules/aoc \
    private/google-modules/aoc/alsa \
    private/google-modules/aoc/usb \
    private/google-modules/wlan/bcmdhd4389 \
    private/google-modules/wlan/bcmdhd43752 \
    private/google-modules/bluetooth/broadcom \
    private/google-modules/bms \
    private/google-modules/power/reset \
    private/google-modules/amplifiers/cs35l45 \
    private/google-modules/amplifiers/cs40l26 \
    private/google-modules/amplifiers/drv2624 \
    private/google-modules/amplifiers/audiometrics \
    private/google-modules/amplifiers/cs40l25 \
    private/google-modules/amplifiers/cs35l41

BOOT_KERNEL_MODULES += \
    heatmap.ko \
    touch_offload.ko

KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/gs101/modules.load))
KERNEL_MODULES_LOAD := $(foreach m,$(KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(filter-out $(BOOT_KERNEL_MODULES), $(KERNEL_MODULES_LOAD))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(filter $(BOOT_KERNEL_MODULES), $(KERNEL_MODULES_LOAD))

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
