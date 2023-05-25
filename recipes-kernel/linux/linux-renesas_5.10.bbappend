DESCRIPTION = "Econ camera support for RZ/V2L Evaluation Board Kit PMIC version"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/:"

SRC_URI += " file://econ_ar0234_support.dtsi"
#SRC_URI += " file://econ_imx462_support.dtsi"
SRC_URI += " file://pca6408_ioexpander_support.patch"

do_patch_append() {
    cat ${WORKDIR}/*.dtsi >> ${S}/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
    cat ${WORKDIR}/*.dtsi >> ${S}/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
}
