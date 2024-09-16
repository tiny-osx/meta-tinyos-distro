FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://ifplugd \
	file://ifplugd.conf \
	file://ifplugd.action \
	file://ifplugd-wifi.action \
"

do_install:append() {
	
	# Install ifplugd support
	install -d ${D}${sysconfdir}/ifplugd
	install -m 0755 ${WORKDIR}/ifplugd  ${D}${sysconfdir}/init.d/
	
	
	# Allow for wifi support on non-TI platforms
	# if [ "${MACHINE}" != "beaglebone-yocto" ]; then
	#   install -m 0755 ${WORKDIR}/ifplugd-wifi.action ${D}${sysconfdir}/ifplugd/ifplugd.action
	# else
	#   install -m 0755 ${WORKDIR}/ifplugd.action ${D}${sysconfdir}/ifplugd/
	# fi

	install -m 0755 ${WORKDIR}/ifplugd.conf ${D}${sysconfdir}/ifplugd/

}