SUMMARY = "ECAN ar0234 kernel module"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"

inherit module

SRC_URI = "file://Makefile \
           file://ecam-ar0234.c \
           file://common.h \
           file://firmware.h \
           file://ecam25_cuxvr.txt \
           file://COPYING \
          "

S = "${WORKDIR}"

RPROVIDES_${PN} += "kernel-module-ecam-ar0234"
FILES_${PN} += "/etc/modules-load.d/ecam_ar0234.conf"

do_install_append() {
    install -d ${D}/etc/modules-load.d/
    echo "ecam_ar0234" > ${D}/etc/modules-load.d/ecam_ar0234.conf
}
