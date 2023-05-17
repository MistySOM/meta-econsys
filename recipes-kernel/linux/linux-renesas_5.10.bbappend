DESCRIPTION = "Econ camera support for RZ/V2L Evaluation Board Kit PMIC version"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/:"

SRC_URI_append += "\
        file://G2L_ar0234_dtb.patch \
	file://pca6408_ioexpander_support.patch \
"
