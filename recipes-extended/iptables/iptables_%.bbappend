FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://firewall \
    file://iptables.rules \
    file://ip6tables.rules \
"

do_install:append() {
    install -d ${D}${sysconfdir}/iptables
    install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
    install -m 0644 ${WORKDIR}/ip6tables.rules ${D}${sysconfdir}/iptables
    install -m 0755 ${WORKDIR}/firewall ${D}${sbindir}
}