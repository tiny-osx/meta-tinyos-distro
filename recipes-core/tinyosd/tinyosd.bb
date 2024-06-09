LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

inherit dotnet

# SRCREV = "c91b1394213fe57f152534a7e68499926418e95e"
SRCREV = "315a91d98c102054646c4b1b76f0f5dfa0b680e7"

SRC_URI += " \
        git://github.com/tiny-osx/tinyos-daemon;branch=main;protocol=https \
        file://tinyosd.sh \
"
 
S = "${WORKDIR}/git/src"
O = "${WORKDIR}/artifacts"
PV = "1.0+git${SRCPV}"

FILES:${PN} += "\
    ${datadir}/tinyosd \
"

do_compile()  {
    dotnet publish \
        ${S}/TinyOS.Daemon.sln \
        --configuration Release \
        --runtime ${BUILD_TARGET} \
        --output ${O}
}

# do_compile()  {
#     dotnet publish \
#         ${S}/TinyOS.Daemon \
#         -p:PublishAot=true \
#         -p:PublishSingleFile=false \
#         --configuration Release \
#         --runtime ${BUILD_TARGET} \
#         --output ${O}
# }

do_install() {
    install -d ${D}${sysconfdir}/init.d/
    install -c -m 755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
    
    install -d ${D}${datadir}/tinyosd
    install -c -m 755 ${O}/tinyosd ${D}${datadir}/tinyosd

    install -d ${D}${bindir}
    ln -rs ${D}${datadir}/tinyosd/tinyosd ${D}${bindir}/tinyosd
}

inherit update-rc.d

INITSCRIPT_NAME = "tinyosd.sh"
INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."