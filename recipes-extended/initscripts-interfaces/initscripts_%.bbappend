DESCRIPTION = "Ethernet interface configuration"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

RDEPENDS_${PN} = "init-ifupdown"

SRC_URI += " \
    file://eth0.init \
    file://eth0.default \
    file://eth1.init \
    file://eth1.default \
    file://usb0.init \
    file://usb0.default \
    file://wlan0.init \
    file://wlan0.default \
"

do_install:append() {
    install -d ${D}${sysconfdir}/init.d
    install -m 0750 ${WORKDIR}/eth0.init ${D}${sysconfdir}/init.d/eth0
    install -m 0750 ${WORKDIR}/eth1.init ${D}${sysconfdir}/init.d/eth1
    install -m 0750 ${WORKDIR}/usb0.init ${D}${sysconfdir}/init.d/usb0
    install -m 0750 ${WORKDIR}/wlan0.init ${D}${sysconfdir}/init.d/wlan0

    install -d ${D}${sysconfdir}/default
    install -m 0644 ${WORKDIR}/eth0.default ${D}${sysconfdir}/default/eth0
    install -m 0644 ${WORKDIR}/eth1.default ${D}${sysconfdir}/default/eth1
    install -m 0644 ${WORKDIR}/usb0.default ${D}${sysconfdir}/default/usb0
    install -m 0644 ${WORKDIR}/wlan0.default ${D}${sysconfdir}/default/wlan0

    update-rc.d -r ${D} eth0 start 80 2 3 4 5 .
    update-rc.d -r ${D} eth1 start 80 2 3 4 5 .
    update-rc.d -r ${D} usb0 start 80 2 3 4 5 .
    update-rc.d -r ${D} wlan0 start 80 2 3 4 5 .
}