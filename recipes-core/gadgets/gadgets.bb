LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

MACHINE_ESSENTIAL_EXTRA_RDEPENDS += " \
    kernel-module-u-ether \
    kernel-module-u-serial \
    kernel-module-usb-f-rndis \
    kernel-module-usb-f-acm \
"

SRC_URI += " \
        file://init.sh \
"

inherit update-rc.d

INITSCRIPT_NAME = "gadgets"
INITSCRIPT_PARAMS = "start 99 2 3 4 5 . stop 20 0 1 6 ."

do_install() {
	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${WORKDIR}/init.sh ${D}${sysconfdir}/init.d/gadgets

    # echo "GS0:12345:respawn:/bin/start_getty 115200 ttyS0 vt102" >> ${D}${sysconfdir}/inittab
}