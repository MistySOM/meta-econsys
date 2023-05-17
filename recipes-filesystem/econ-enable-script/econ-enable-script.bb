LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://econ-enable.sh"

inherit allarch

do_install() {
    install -d ${D}/home/root/
    install -m 0766 ${WORKDIR}/econ-enable.sh ${D}/home/root/
}

FILES_${PN} = "/home/root/econ-enable.sh"
