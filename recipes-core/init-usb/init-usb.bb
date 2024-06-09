SUMMARY = "Initscript for enabling USB gadget Ethernet"
DESCRIPTION = "This module allows ethernet emulation over USB"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI += " \
    file://usb-gether \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${sysconfdir}
    install -d ${D}${sysconfdir}/init.d
    install usb-gether ${D}${sysconfdir}/init.d
}

inherit update-rc.d allarch

INITSCRIPT_NAME = "usb-gether"
INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."