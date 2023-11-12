#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/earth

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    lk \
    preloader \
    product \
    product \
    system \
    system \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor \
    vendor_boot

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# V A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Dynam
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31

# API
PRODUCT_SHIPPING_API_LEVEL := 31

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl-2.1 \
    android.hardware.health@2.1-service \
    libhealthd.$(PRODUCT_PLATFORM)

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-impl
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES_DEBUG += \
    bootctrl.mt6768

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mtk.so \
    fastbootd

# MTK PlPath Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils.recovery

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client


PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload
