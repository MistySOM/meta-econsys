SUMMARY = "ECAN imx462 kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"

inherit module

SRC_URI = "file://Makefile \
           file://ecam-imx462.c \
           file://common.h \
           file://imx462_firmware.txt \
           file://COPYING \
           file://econ-imx462-init.sh \
          "

S = "${WORKDIR}"
RPROVIDES_${PN} += "kernel-module-ecam-imx462"

FILES_${PN} += "/home/root/econ-imx462-init.sh"

do_install_append() {
#     install -d ${D}/etc/modules-load.d/
#     echo "ecam_imx462" > ${D}/etc/modules-load.d/ecam_imx462.conf

    install -d ${D}/home/root/
    install -m 0766 ${WORKDIR}/econ-imx462-init.sh ${D}/home/root/
}
