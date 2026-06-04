FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://sandbox_defconfig_fragment.cfg"
UBOOT_CONFIG_FRAGMENT += "sandbox_defconfig_fragment.cfg"