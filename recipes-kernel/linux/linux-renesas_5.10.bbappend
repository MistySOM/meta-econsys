DESCRIPTION = "Econ camera support for RZ/V2L Evaluation Board Kit PMIC version"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/:"

SRC_URI += " file://econ_ar0234_support.dtse"
SRC_URI += " file://econ_imx462_support.dtse"
SRC_URI += " file://pca6408_ioexpander_support.patch"
DT = "${@d.getVar('KERNEL_DEVICETREE', True).strip().rsplit('/', 1)[-1].rsplit('.', 1)[0]}"

do_install_append() {
	DTS_FILE="${S}/arch/arm64/boot/dts/renesas/${DT}.dts"
	DTB_FILE="${B}/arch/arm64/boot/dts/renesas/${DT}.dtb"
	cp ${DTS_FILE} ${WORKDIR}/${DT}.dts.orig

	cat "${WORKDIR}/econ_ar0234_support.dtse" >> ${DTS_FILE}
	oe_runmake ${KERNEL_DEVICETREE}
	install -m 0644 ${DTB_FILE} ${D}/boot/${DT}-ar0234.dtb
	cp ${WORKDIR}/${DT}.dts.orig ${DTS_FILE}

	cat "${WORKDIR}/econ_imx462_support.dtse" >> ${DTS_FILE}
	oe_runmake ${KERNEL_DEVICETREE}
	install -m 0644 ${DTB_FILE} ${D}/boot/${DT}-imx462.dtb
	cp ${WORKDIR}/${DT}.dts.orig ${DTS_FILE}
}
