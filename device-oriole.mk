#
# SPDX-FileCopyrightText: 2020 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := raviole
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

# Inherit from gs101
include device/google/gs101/device-shipping-common.mk

# Overlays
PRODUCT_PACKAGES += \
    DeviceAsWebcamRaviole \
    FrameworkResOverlayProductRaviole \
    FrameworkResOverlayVendorRaviole \
    ONSOverlayVendorRaviole \
    PixelNfcOverlayRaviole \
    SafetyRegulatoryInfoOverlayProductRaviole \
    SconeCbrsOverlay \
    SystemUIGoogleOverlayVendorRaviole

PRODUCT_PACKAGES += \
    DMServiceOverlayVendorOriole \
    FrameworkResOverlayProductOriole \
    FrameworkResOverlayVendorOriole \
    HbmSVManagerOverlayProductOriole \
    PixelNfcOverlayOriole \
    SettingsGoogleOrioleOverlay \
    SettingsGoogleOverlayProductOriole \
    SettingsOverlayG9S9B \
    SettingsOverlayGB7N6 \
    SettingsOverlayGR1YH \
    SystemUIGoogleOverlayProductOriole \
    SystemUIGoogleOverlayVendorOriole

PRODUCT_PACKAGES += \
    ApertureOverlayOriole \
    LineageSdkOverlayRaviole \
    SettingsOverlayRaviole

# PowerShare
include hardware/google/pixel/powershare/device.mk

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.oriole.rc

PRODUCT_PACKAGES += \
    init.recovery.oriole.touch.rc

# SecureElement
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2-service-gto-ese2

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Vibrator
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/lib/android.hardware.vibrator-V2-ndk.so \
    system/lib64/android.hardware.vibrator-V2-ndk.so

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml
