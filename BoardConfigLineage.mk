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
TARGET_EXTERNAL_MODULE_PATH := private/google-modules
TARGET_EXTERNAL_MODULES := \
	nfc \
	nfc/ese \
	display/samsung \
	uwb/kernel \
	gpu/mali_kbase \
	gpu/mali_pixel \
	lwis \
	edgetpu/drivers/edgetpu \
	touch/common \
	touch/sec \
	touch/fts/ftm5 \
	fingerprint/fpc \
	aoc \
	aoc/alsa \
	aoc/usb \
	wlan/bcmdhd4389 \
	wlan/bcmdhd43752 \
	bluetooth/broadcom \
	bms \
	power/reset \
	amplifiers/cs35l45 \
	amplifiers/cs40l26 \
	amplifiers/drv2624 \
	amplifiers/audiometrics \
	amplifiers/cs40l25 \
	amplifiers/cs35l41

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
