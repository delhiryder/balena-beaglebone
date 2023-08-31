UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

UBOOT_MACHINE = "am335x_evm_config"
UBOOT_MACHINE:beaglebone-play = "am62x_evm_a53_defconfig"
UBOOT_MACHINE:beaglebone-play-k3r5 = "am62x_evm_r5_defconfig"

# Use BeagleBone's u-boot until u-boot-ti-staging has the BBAI64 support upstreamed.
BRANCH:beaglebone-play= "v2021.01-ti-BeaglePlay-Release"
UBOOT_GIT_URI:beaglebone-play = "git://git.beagleboard.org/beagleboard/u-boot.git"
SRCREV:beaglebone-play = "f036fbdc25941d7585182d2552c767edb9b04114"


FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://uEnv.txt_internal \
    file://balenaos_disableuefi.cfg \
"

SSTATE_ALLOW_OVERLAP_FILES += "${DEPLOY_DIR_IMAGE}/extra_uEnv.txt"
SSTATE_ALLOW_OVERLAP_FILES += "${DEPLOY_DIR_IMAGE}/uEnv.txt_internal"


do_deploy:append () {
    install ${WORKDIR}/uEnv.txt_internal ${DEPLOYDIR}
}
