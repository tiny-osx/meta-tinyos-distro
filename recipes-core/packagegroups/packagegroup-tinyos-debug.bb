DESCRIPTION = "TinyOS application debug packagegroup"
# LICENSE = "MIT"
# LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

PROVIDES = "${PACKAGES}"
PACKAGES = " \
	packagegroup-tinyos-debug \
	packagegroup-tinyos-debug-base \
	packagegroup-tinyos-debug-shell \
	packagegroup-tinyos-debug-gpio \
	packagegroup-tinyos-debug-fonts \ 
	packagegroup-tinyos-debug-vscode \
	packagegroup-tinyos-debug-dotnet \
"

RDEPENDS:${PN} = " \
	packagegroup-tinyos \
	packagegroup-tinyos-debug \
	packagegroup-tinyos-debug-base \
	packagegroup-tinyos-debug-shell \
	packagegroup-tinyos-debug-gpio \
	packagegroup-tinyos-debug-fonts \ 
	packagegroup-tinyos-debug-vscode \
	packagegroup-tinyos-debug-dotnet \
"

RDEPENDS:packagegroup-tinyos-debug-base = "\
	fio \
	fbset \
	resize-rootfs \
"

RDEPENDS:packagegroup-tinyos-debug-shell = "\
	git \
	curl \
"

RDEPENDS:packagegroup-tinyos-debug-gpio = "\
	i2c-tools \
	libgpiod-tools \
"

RDEPENDS:packagegroup-tinyos-debug-fonts = "\
	fontconfig-utils \
"

RDEPENDS:packagegroup-tinyos-debug-vscode = "\
	ldd \
	procps \
	vscode-cli \
"

RDEPENDS:packagegroup-tinyos-debug-dotnet = "\
	vsdbg \
	dotnet-sdk \
	dotnet-sdk-dev \
	dotnet-sdk-dbg \
	dotnet-scripts \
"