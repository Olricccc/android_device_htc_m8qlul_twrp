# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#


# Default device path
DEVICE_PATH := device/$(PRODUCT_BRAND)/$(TARGET_DEVICE)

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(shell echo $(PRODUCT_PLATFORM) | tr  '[:lower:]' '[:upper:]')
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno405

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53


# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive lpm_levels.sleep_disabled=1 boot_cpus=0-7 androidtouch.htc_event=1 disk_mode_enable=1 zswap.enabled=1

BOARD_KERNEL_BASE := 0x80078000
BOARD_KERNEL_DT := $(DEVICE_PATH)/prebuilt/dt.img
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_RAMDISK_OFFSET := 0x01f88000
BOARD_KERNEL_TAGS_OFFSET := 0x01d88000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := \
    --dt $(BOARD_KERNEL_DT) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_KERNEL_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

# Partitions
BOARD_FLASH_BLOCK_SIZE             := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432    # 0x002000000
BOARD_CACHEIMAGE_PARTITION_SIZE    := 268435456   # 0x010000000
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 262144      # 0x000040000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    # 0x002000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 4294967296  # 0x100000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10334748672 # 0x268000000 ~ 10334765056 - 16384

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Android version & Security Patch Level
# Default TWRP Values
PLATFORM_VERSION := 20.1.0
PLATFORM_SECURITY_PATCH := 2099-12-31

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_USES_QCOM_DECRYPTION := true
BOOTLOADER_MESSAGE_OFFSET := 2048

# TWRP Build Flags
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_INPUT_BLACKLIST := hbtp_vm
TW_THEME := portrait_hdpi
TW_DEFAULT_BRIGHTNESS := 150
TW_THEME := portrait_hdpi
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_SUPERSU := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_NEW_ION_HEAP := true
TW_NO_EXFAT_FUSE := true
TW_USE_TOOLBOX := true

# TWRP Debugging
#TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/bin/debuggerd
#TARGET_RECOVERY_DEVICE_MODULES += strace
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/xbin/strace
#TW_CRYPTO_SYSTEM_VOLD_DEBUG := true
#TW_CRYPTO_SYSTEM_VOLD_DISABLE_TIMEOUT := true

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_m8qlul
