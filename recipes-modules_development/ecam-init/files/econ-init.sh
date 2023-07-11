#!/bin/sh

cru=$(cat /sys/class/video4linux/video*/name | grep "CRU")
csi2=$(cat /sys/class/video4linux/v4l-subdev*/name | grep "csi2")
module=$(cat /sys/class/video4linux/v4l-subdev*/name | grep 0-)

# Available resolution of AR0234.
# Please choose one of a following resolution then comment out the rest.

econ_res=$1

#econ_res=1280x720
#econ_res=1920x1080
#econ_res=1920x1200


if [ -z "$1" ]
then
	echo "Usage Example: econ-init.sh 1920x1080" >&2
	echo "  Available Resolutions :  1920x1080 , 1280x720 , 640x480" >&2
	exit 1
fi

if [ -z "$module" ]
then
	echo "Error: No device module found. Make sure you have the right devicetree and kernel module is loaded." >&2
	exit 1
fi

if [ -z "$cru" ]
then
	echo "Error: No CRU video device found." >&2
	exit 1
fi

media-ctl -d /dev/media0 -r
if [ -z "$csi2" ]
then
	echo "Error: No MIPI CSI2 sub video device found." >&2
fi

media-ctl -d /dev/media0 -l "'rzg2l_csi2 10830400.csi2':1 -> 'CRU output':0 [1]"
media-ctl -d /dev/media0 -V "'rzg2l_csi2 10830400.csi2':1 [fmt:UYVY8_2X8/$econ_res field:none]"
media-ctl -d /dev/media0 -V "'$module':0 [fmt:UYVY8_2X8/$econ_res field:none]"
echo "Linked CRU/CSI2 to ECON '$module' with format UYVY8_2X8 and resolution $econ_res"

