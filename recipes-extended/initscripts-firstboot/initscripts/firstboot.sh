#!/bin/sh

do_boot_file_copy() {
	
    if [ -d /boot/eth0.default ]; then
		mv -f /boot/eth0.default /etc/default/eth0
	fi

    if [ -d /boot/eth1.default ]; then
		mv -f /boot/eth1.default /etc/default/eth1
	fi

	if [ -d /boot/usb0.default ]; then
		mv -f /boot/usb0.default /etc/default/eth1
	fi

	if [ -d /boot/wlan0.default ]; then
		mv -f /boot/wlan0.default /etc/default/eth1
	fi
}

do_boot_file_copy

update-rc.d -f firstboot remove