SUMMARY = "A dotnet debug console-only TinyOS image"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

include tinyos-image.inc

# Set hostname
# hostname:pn-base-files = "tos-dbg"
DEBUG_HOSTNAME = "tos-dbg"

# Additional image configuration defaults
EXTRA_IMAGE_FEATURES ?= " \ 
    ssh-server-openssh \
"

# Adds Admin user to root group
EXTRA_USERS_PARAMS += " \
    usermod -p '${ADMIN_USER_PASSWORD_ENCRYPTED}' root; \
    usermod -a -G sudo ${ADMIN_USER_NAME}; \
    usermod -a -G root ${ADMIN_USER_NAME}; \
"

# Adds 4GB extra free space to the root filesystem
IMAGE_ROOTFS_EXTRA_SPACE = "4194304"

# Additional application configuration
CORE_IMAGE_EXTRA_INSTALL += " \
    tinyosd \
    packagegroup-tinyos-debug \
"

# Perform some changes to the rootfs
rootfs_image_postprocess() {

    # Set the hostname
    echo ${DEBUG_HOSTNAME} > ${IMAGE_ROOTFS}/etc/hostname
}

ROOTFS_POSTPROCESS_COMMAND += "rootfs_image_postprocess;"