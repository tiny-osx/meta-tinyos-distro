FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://dot.profile \
    file://dot.bashrc \
"

do_install:append() {
    install -m 0644 ${WORKDIR}/dot.profile ${D}${sysconfdir}/skel/.profile
    install -m 0644 ${WORKDIR}/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
}