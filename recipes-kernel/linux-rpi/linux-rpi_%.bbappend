FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://iwd-enable.cfg \
    file://logo-enable.cfg \
    file://fbcon.c.patch \
    file://embetrix.png \
"

# TARGET_DEFCONFIG="${B}/.config"

do_add_logo[depends] += "imagemagick-native:do_populate_sysroot"
addtask add_logo after do_patch before do_compile

do_add_logo () {

    convert.im7 -colors 224 -format ppm -compress none \
                ${WORKDIR}/embetrix.png \
                ${STAGING_KERNEL_DIR}/drivers/video/logo/logo_linux_clut224.ppm
}

# do_configure:prepend() {
    
#     # Add the kernel_defconf_variable function
#     kernel_defconf_variable() {
#        CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
#        if test "$2" = "n"
#        then
#            echo "# CONFIG_$1 is not set" >>  ${TARGET_DEFCONFIG}
#        else
#            echo "CONFIG_$1=$2" >>  ${TARGET_DEFCONFIG}
#        fi
#     }

#     # logo support, if you supply logo_linux_clut224.ppm in SRC_URI, then it's going to be used
#     # if [ -e ${S}/drivers/video/logo/logo_linux_clut224.ppm ]; then
#         kernel_defconf_variable LOGO y
#         kernel_defconf_variable LOGO_LINUX_CLUT224 y
#         kernel_defconf_variable LOGO_VARISCITE_CLUT224 n
#     # fi
# }


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

# SRC_URI += "\
#     file://iwd-enable.cfg \
#     file://fbcon-disable.cfg \
#     file://fbcon.c.patch \
#     file://embetrix.png \
# "