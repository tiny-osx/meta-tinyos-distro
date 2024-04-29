LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit useradd
USERADD_PACKAGES = "${PN}"
GROUPADD_PARAM:${PN} = "--system dotnet"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://init.d \
"

do_install:append() {
    install -m 0775 -g dotnet -d ${D}/apps
    install -m 0775 -g dotnet ${WORKDIR}/init.d ${D}/apps
}

FILES:${PN} += "/apps"