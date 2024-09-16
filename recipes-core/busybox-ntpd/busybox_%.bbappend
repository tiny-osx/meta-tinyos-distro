FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://ntpd \
"

do_install:append() {

	# Install ntpd startup script
	install -d ${D}${sysconfdir}/network/if-up.d
	install -m 0755 ${WORKDIR}/ntpd  ${D}${sysconfdir}/network/if-up.d/
}