FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:sandbox-stm32mp25 = " file://sandbox-uboot.cfg;subdir=fragments "

UBOOT_CONFIG_FRAGMENT:append:sandbox-stm32mp25 = " ${WORKDIR}/fragments/sandbox-uboot.cfg "