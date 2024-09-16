FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://crond \
	file://0daily \
	file://0hourly \
	file://fstrim.cron \ 
    file://ntpd.cron \
	file://ntpd-enable.cfg \
"

do_install:append() {
	
	# Install cron setup
	install -d ${D}${sysconfdir}/cron.d
	install -d ${D}${sysconfdir}/cron.daily
	install -d ${D}${sysconfdir}/cron.hourly

	# We run fstrim every hour now
	install -m 0444 ${WORKDIR}/0hourly  ${D}${sysconfdir}/cron.d/
	install -p -m 4755 ${WORKDIR}/fstrim.cron ${D}${sysconfdir}/cron.hourly/fstrim

	# Run ntpd every hour as well
	install -p -m 4755 ${WORKDIR}/ntpd.cron ${D}${sysconfdir}/cron.hourly/ntpd
}