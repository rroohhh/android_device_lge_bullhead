#
# Copyright (C) 2015 The Android Open-Source Project
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

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PHONY_TARGETS := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8992
TARGET_BOOTLOADER_BOARD_NAME := bullhead
TARGET_BOARD_INFO_FILE := device/lge/bullhead/board-info.txt
TARGET_NO_RPC := true
BOARD_EGL_CFG := device/lge/bullhead/egl.cfg
TARGET_AUX_OS_VARIANT_LIST := bullhead

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/bullhead/bluetooth
BOARD_HAS_QCA_BT_ROME := true
WCNSS_FILTER_USES_SIBS := true

# Camera

# Force camera module to be compiled only in 32-bit mode on 64-bit systems
# Once camera module can run in the native mode of the system (either
# 32-bit or 64-bit), the following line should be deleted
BOARD_QTI_CAMERA_32BIT_ONLY := true

TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /vendor/bin/mm-qcamera-daemon=27

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# DEXPREOPT
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      DONT_DEXPREOPT_PREBUILTS := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_DEBUG_INFO := false

# Display
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_GRALLOC1_ADAPTER := true
TARGET_USES_HWC2 := true
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
# as of 3765008, inode usage was 3011, use 4096 to be safe
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11649679360
BOARD_CACHEIMAGE_PARTITION_SIZE := 100663296
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 260046848
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor

TARGET_RECOVERY_FSTAB = device/lge/bullhead/fstab.bullhead

TARGET_FS_CONFIG_GEN += device/lge/bullhead/configs/config.fs
BOARD_ROOT_EXTRA_FOLDERS := persist firmware

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# HIDL
DEVICE_MANIFEST_FILE := device/lge/bullhead/manifest.xml
DEVICE_MATRIX_FILE := device/lge/bullhead/compatibility_matrix.xml

# Kernel
KERNEL_TOOLCHAIN := $(PWD)/prebuilts/custom-gcc/arm64-gcc/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-elf-
TARGET_KERNEL_SOURCE := kernel/lge/bullhead
TARGET_KERNEL_CONFIG := shadow_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_RAMDISK_USE_XZ := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=bullhead boot_cpus=0-5
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 msm_poweroff.download_mode=0
BOARD_KERNEL_CMDLINE += loop.max_part=7 androidboot.boot_devices=soc.0/f9824900.sdhci
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Binder
TARGET_USES_64_BIT_BINDER := true
# Legacy memfd
TARGET_HAS_MEMFD_BACKPORT := true

# Power
TARGET_USES_INTERACTION_BOOST := true

# Radio
TARGET_USES_OLD_MNC_FORMAT := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/lge/bullhead/sepolicy

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/vendor/lib64/libril-qc-qmi-1.so|libaudioclient_shim.so

# WiFi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_AVOID_IFACE_RESET_MAC_CHANGE := true

# MISC
BOARD_USES_SECURE_SERVICES := true
TARGET_RELEASETOOLS_EXTENSIONS := device/lge/bullhead
TARGET_USES_AOSP := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_nanohub
# Netd
TARGET_OMIT_NETD_TETHER_FTP_HELPER := true
#Enable peripheral manager
TARGET_PER_MGR_ENABLED := true
# Testing related defines
BOARD_PERFSETUP_SCRIPT := platform_testing/scripts/perf-setup/bullhead-setup.sh
# Enable workaround for slow rom flash
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_FLATTEN_APEX := true
# Security Patch Level
VENDOR_SECURITY_PATCH := 2018-12-05

-include vendor/lge/bullhead/BoardConfigVendor.mk
