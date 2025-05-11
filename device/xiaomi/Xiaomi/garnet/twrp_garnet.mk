# twrp_garnet.mk - Product spec for OrangeFox recovery
PRODUCT_NAME := twrp_garnet
PRODUCT_DEVICE := garnet
PRODUCT_BRAND := xiaomi
PRODUCT_MODEL := Xiaomi Garnet
PRODUCT_ARCH := arm64
include $(CLEAR_VARS)
# Include OrangeFox recovery makefile
FOXMK := vendor/fox/vendor.mk
include $(FOXMK)
