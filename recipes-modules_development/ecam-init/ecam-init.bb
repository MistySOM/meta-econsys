LICENSE = "CLOSED"
SRC_URI = "file://econ-init.sh"
FILES_${PN} += "/home/root/econ-init.sh"

do_install_append() {
    install -d ${D}/home/root/
    install -m 0766 ${WORKDIR}/econ-init.sh ${D}/home/root/
}
