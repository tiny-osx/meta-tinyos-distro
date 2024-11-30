DESCRIPTION = "First boot initialization scripts"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://firstboot.init \
    file://firstboot.sh \
"

do_install:append() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/firstboot.sh ${D}${bindir}/firstboot

    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/firstboot.init ${D}${sysconfdir}/init.d/firstboot

    update-rc.d -r ${D} firstboot start 70 2 3 4 5 .
}