FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://iwd \
    file://main.conf \
"
# PACKAGECONFIG:append = " wired"

INITSCRIPT_NAME = "iwd"
INITSCRIPT_PACKAGES = "${PN}"

inherit update-rc.d

do_install:append() {
	install -d ${D}${sysconfdir}/iwd
	install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/iwd

    install -d ${D}${INIT_D_DIR}
    install -m 0755 ${WORKDIR}/iwd ${D}${INIT_D_DIR}/${PN}
}