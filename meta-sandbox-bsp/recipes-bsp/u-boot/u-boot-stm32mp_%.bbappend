FILESEXTRAPATHS:prepend := "${THISDIR}/fragments:"

SRC_URI:append:sandbox-stm32mp25 = " \
    file://sandbox-uboot.cfg \
"

UBOOT_CONFIG_FRAGMENT:append:sandbox-stm32mp25 = "sandbox-uboot.cfg"