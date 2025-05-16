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

#!/bin/bash

	export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v28.1.zip
	export FOX_VIRTUAL_AB_DEVICE=1
        export FOX_VANILLA_BUILD=1
        export FOX_ENABLE_APP_MANAGER=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
        export FOX_RECOVERY_PARTITION="/dev/block/bootdevice/by-name/recovery
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/bootdevice/by-name/boot"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	
	export OF_MAINTAINER_AVATAR="device/xiaomi/garnet/maintainer_avatar.png"
        cp "${OF_MAINTAINER_AVATAR}" "$(gettop)/bootable/recovery/gui/theme/portrait_hdpi/images/Default/About/maintainer.png"
        export OF_MAINTAINER="TegarXLu"
        export FOX_VARIANT="UNOFFICIAL"
        
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_LZ4_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_ZSTD_BINARY=1
	export ALLOW_MISSING_DEPENDENCIES=true
	export FOX_USE_NANO_EDITOR=1
        export FOX_DELETE_AROMAFM=1
	export FOX_USE_DATE_BINARY=1
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
#
