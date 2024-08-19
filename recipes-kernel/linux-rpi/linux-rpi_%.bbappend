FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://iwd-enable.cfg \
    file://fbcon-disable.cfg \
    file://gadget-enable.cfg \
"