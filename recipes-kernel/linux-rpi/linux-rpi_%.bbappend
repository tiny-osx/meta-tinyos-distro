FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://iwd-enable.cfg \
    file://fbcon-disable.cfg \
"

# MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-module-g-ether kernel-module-usb-f-eem"

# USB gadget serial console
# KERNEL_MODULE_AUTOLOAD += "g_multi"
# SERIAL_CONSOLES += "115200;ttyGS0"

# g_cdc g_ether g_multi
# module_conf_g_cdc = "options g_cdc idVendor=0x3032 idProduct=0x0001 iProduct=Neutis_N5 iManufacturer=Emlid"

# KERNEL_MODULE_PROBECONF += "g_cdc"

# KERNEL_MODULE_AUTOLOAD += "g_ether"
# KERNEL_MODULE_PROBECONF += "g_ether"
# module_conf_g_ether = "options g_ether host_addr=00:11:22:33:44:55"

# KERNEL_MODULE_AUTOLOAD += "g_serial"
# KERNEL_MODULE_PROBECONF += "g_serial"
# module_conf_g_serial = "options g_serial vendor=0x8086 product=0xBABE"