#
# SPDX-FileCopyrightText: 2020 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/google/gs101/aosp_common.mk)
$(call inherit-product, device/google/raviole/device-raven.mk)

PRODUCT_NAME := aosp_raven
PRODUCT_DEVICE := raven
PRODUCT_MODEL := AOSP on Raven
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := Google
