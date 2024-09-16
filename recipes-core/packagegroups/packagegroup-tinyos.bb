DESCRIPTION = "TinyOS application packagegroup"
# LICENSE = "MIT"
# LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

PROVIDES = "${PACKAGES}"
PACKAGES = " \
	packagegroup-tinyos \
	packagegroup-tinyos-base \
	packagegroup-tinyos-gpio \
	packagegroup-tinyos-input \
	packagegroup-tinyos-fonts \
	packagegroup-tinyos-vsdgb \
	packagegroup-tinyos-opengl \
	packagegroup-tinyos-wireless \
"
RDEPENDS:${PN} = " \
	packagegroup-tinyos \
	packagegroup-tinyos-base \
	packagegroup-tinyos-gpio \
	packagegroup-tinyos-input \
	packagegroup-tinyos-fonts \
	packagegroup-tinyos-vsdgb \
	packagegroup-tinyos-opengl \
	packagegroup-tinyos-wireless \
"

RDEPENDS:packagegroup-tinyos-base = "\
    sudo \
    watchdog \
	os-release \
"

RDEPENDS:packagegroup-tinyos-gpio = "\
	libgpiod \
	libgpiod-dev \
"

RDEPENDS:packagegroup-tinyos-input = "\
	libinput \
"

RDEPENDS:packagegroup-tinyos-fonts = "\
    fontconfig \
    liberation-fonts \
"

RDEPENDS:packagegroup-tinyos-vsdgb = "\
	vsdbg \
"

RDEPENDS:packagegroup-tinyos-opengl = "\
	libegl \
	libdrm \
	libgbm \
"

RDEPENDS:packagegroup-tinyos-wireless = "\
	wireless-regdb-static \
"