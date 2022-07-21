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

# GKI
TARGET_EXTERNAL_MODULES := \
	google-modules/nfc \
	google-modules/nfc/ese \
	google-modules/display/samsung \
	google-modules/uwb/kernel \
	google-modules/gpu/mali_kbase \
	google-modules/gpu/mali_pixel \
	google-modules/lwis \
	google-modules/edgetpu/drivers/edgetpu \
	google-modules/touch/common \
	google-modules/touch/sec \
	google-modules/touch/fts/ftm5 \
	google-modules/fingerprint/fpc \
	google-modules/aoc \
	google-modules/aoc/alsa \
	google-modules/aoc/usb \
	google-modules/wlan/bcmdhd4389 \
	google-modules/wlan/bcmdhd43752 \
	google-modules/bluetooth/broadcom \
	google-modules/bms \
	google-modules/power/reset \
	google-modules/amplifiers/cs35l45 \
	google-modules/amplifiers/cs40l26 \
	google-modules/amplifiers/drv2624 \
	google-modules/amplifiers/audiometrics \
	google-modules/amplifiers/cs40l25 \
	google-modules/amplifiers/cs35l41

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
