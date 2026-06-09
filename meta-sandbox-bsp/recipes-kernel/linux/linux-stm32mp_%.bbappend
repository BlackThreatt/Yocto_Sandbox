FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:sandbox-stm32mp25 = " file://${LINUX_VERSION}/sandbox-kernel.config;subdir=fragments "

KERNEL_CONFIG_FRAGMENTS:append:sandbox-stm32mp25 = " ${WORKDIR}/fragments/${LINUX_VERSION}/sandbox-kernel.config "
