DESCRIPTION = "Econ camera support for RZ/V2L Evaluation Board Kit PMIC version"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/:"

SRC_URI += "\
        file://econ-camera-support.dtsi \
        file://pca6408_ioexpander_support.patch \
"

do_patch_append() {
        cat ${WORKDIR}/econ-camera-support.dtsi >> ${S}/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
        cat ${WORKDIR}/econ-camera-support.dtsi >> ${S}/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
}
