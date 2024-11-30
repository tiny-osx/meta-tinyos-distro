DESCRIPTION = "Resize root FS to maximum size"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

RDEPENDS:${PN} = "parted e2fsprogs-resize2fs"

SRC_URI += " \
    file://resize-rootfs.sh \
    file://resize-rootfs.init \
"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/resize-rootfs.sh ${D}${bindir}/resize-rootfs

    install -d ${D}${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/resize-rootfs.init ${D}${sysconfdir}/init.d/resize-rootfs

    # update-rc.d resize-rootfs 80 2 3 4 5 .
}