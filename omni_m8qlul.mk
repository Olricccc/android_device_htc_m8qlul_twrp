# Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/cdma.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m8qlul/full_m8qlul.mk)
# Release name
PRODUCT_RELEASE_NAME := m8qlul

# Inherit some common DU stuff.
$(call inherit-product, vendor/omni/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m8qlul
PRODUCT_NAME := omni_m8qlul
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := HTC
PRODUCT_MODEL := HTC One M8s