#!/system/bin/sh
#
# set some props, depending on device
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024-2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

setdevicespecs() {
    resetprop "ro.product.device" "$1";
    resetprop "ro.product.vendor.device" "$1";
    resetprop "ro.product.odm.device" "$1";
    resetprop "ro.build.product" "$1";
    resetprop "ro.product.system.device" "$1";
    resetprop "ro.product.system_ext.device" "$1";
}

do_props() {
#    resetprop "ro.product.model" "$device_description";
#    resetprop "ro.product.odm.model" "$device_description";
#    resetprop "ro.product.system.model" "$device_description";
#    resetprop "ro.product.vendor.model" "$device_description";
#    resetprop "ro.product.system_ext.model" "$device_description";
#    resetprop "ro.product.product.model" "$device_description";

    resetprop "ro.product.model" "$model";
    resetprop "ro.product.odm.model" "$model";
    resetprop "ro.product.system.model" "$model";
    resetprop "ro.product.vendor.model" "$model";
    resetprop "ro.product.system_ext.model" "$model";
    resetprop "ro.product.product.model" "$model";
    resetprop "ro.product.bootimage.model" "$model";

    resetprop "ro.product.marketname" "$device_description";
    resetprop "ro.product.odm.marketname" "$device_description";
    resetprop "ro.product.vendor.marketname" "$device_description";
    resetprop "bluetooth.device.default_name" "$device_description";
    resetprop "vendor.usb.product_string" "$device_description";

    resetprop "ro.product.brand" "$brand";
    resetprop "ro.product.odm.brand" "$brand";
    resetprop "ro.product.system.brand" "$brand";
    resetprop "ro.product.system_ext.brand" "$brand";
    resetprop "ro.product.product.brand" "$brand";
    resetprop "ro.product.vendor.brand" "$brand";
}

do_india() {
        if [ "$sku" = "garnet" ]; then
            device_description="Redmi Note 13 Pro 5G";
            model="2312DRA50I";
        else
            brand="POCO";
            device_description="POCO X6 5G";
            model="23122PCD1I";
        fi
}

do_global() {
        if [ "$sku" = "garnet" ]; then
            device_description="Redmi Note 13 Pro 5G";
            model="2312DRA50G";
        else
            brand="POCO";
            device_description="POCO X6 5G";
            model="23122PCD1G";
        fi
}

do_CN() {
	hwversion=$(getprop "ro.boot.hwversion");
        device_description="Redmi Note 13 Pro";
        if [ "$hwversion" = "17.0.9" || "$hwversion" = "17.1.9" || "$hwversion" = "17.2.6" || "$hwversion" = "17.2.9" || "$hwversion" = "17.9.9" ]; then
            model="2312CRAD3C";
        else
            model="2312DRA50C";
        fi
}

process_devices() {
	device="garnet";
	brand="Xiaomi";
	region=$(getprop "ro.boot.hwc");
	sku=$(getprop "ro.boot.hardware.sku");

	if [ "$region" = "IN" ]; then
		do_india;
	elif [ "$region" = "GL" ]; then
		do_global;
	elif [ "$region" = "CN" ]; then
		do_CN;
 	else
		do_global;
	fi
    	
    	do_props;
    	setdevicespecs "$device";
}

# ----
	process_devices;
	exit 0;
#
