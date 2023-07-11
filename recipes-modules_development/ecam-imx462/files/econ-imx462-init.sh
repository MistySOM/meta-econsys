#!/bin/sh

cru=$(cat /sys/class/video4linux/video*/name | grep "CRU")
csi2=$(cat /sys/class/video4linux/v4l-subdev*/name | grep "csi2")

# Available resolution of IMX462.
# Please choose one of a following resolution then comment out the rest.

econ_res=$1

#econ_res=1280x720
#econ_res=1920x1080
#econ_res=1920x1200


if [ -z "$1" ]
then
	echo "Available Resolutions :  1920x1080 , 1280x720 , 640x480"
	echo " Usage Example: econ-init.sh 1920x1080"
	exit 1
fi

if [ -z "$cru" ]
then
	echo "No CRU video device founds"
else
	media-ctl -d /dev/media0 -r
	if [ -z "$csi2" ]
	then
		echo "No MIPI CSI2 sub video device founds"
	else
		media-ctl -d /dev/media0 -l "'rzg2l_csi2 10830400.csi2':1 -> 'CRU output':0 [1]"
		media-ctl -d /dev/media0 -V "'rzg2l_csi2 10830400.csi2':1 [fmt:UYVY8_2X8/$econ_res field:none]"
		media-ctl -d /dev/media0 -V "'imx462 0-001f':0 [fmt:UYVY8_2X8/$econ_res field:none]"
		echo "Link CRU/CSI2 to ECON imx462 with format UYVY8_2X8 and resolution $econ_res"
	fi
fi

