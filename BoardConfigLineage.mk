#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true

BOARD_KERNEL_IMAGE_NAME := Image.lz4
TARGET_KERNEL_ADDITIONAL_FLAGS := LLVM=1
TARGET_KERNEL_CONFIG := raviole_defconfig
TARGET_NEEDS_DTBOIMAGE := true
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-
TARGET_KERNEL_ARCH := arm64

# Kernel
TARGET_KERNEL_SOURCE := private/gs-google

# GKI
TARGET_EXTERNAL_MODULES := \
    private/google-modules/nfc \
    private/google-modules/nfc/ese \
    private/google-modules/display/samsung \
    private/google-modules/uwb/kernel \
    private/google-modules/gpu/mali_kbase \
    private/google-modules/gpu/mali_pixel \
    private/google-modules/lwis \
    private/google-modules/edgetpu/drivers/edgetpu \
    private/google-modules/touch/common \
    private/google-modules/touch/sec \
    private/google-modules/touch/fts/ftm5 \
    private/google-modules/fingerprint/fpc \
    private/google-modules/aoc \
    private/google-modules/aoc/alsa \
    private/google-modules/aoc/usb \
    private/google-modules/wlan/bcmdhd4389 \
    private/google-modules/wlan/bcmdhd43752 \
    private/google-modules/bluetooth/broadcom \
    private/google-modules/bms \
    private/google-modules/power/reset \
    private/google-modules/amplifiers/cs35l45 \
    private/google-modules/amplifiers/cs40l26 \
    private/google-modules/amplifiers/drv2624 \
    private/google-modules/amplifiers/audiometrics \
    private/google-modules/amplifiers/cs40l25 \
    private/google-modules/amplifiers/cs35l41

BOOT_KERNEL_MODULES += \
    abrolhos.ko \
    acpm_flexpmu_dbg.ko \
    acpm_mbox_test.ko \
    aoc_alsa_dev.ko \
    aoc_alsa_dev_util.ko \
    aoc_channel_dev.ko \
    aoc_char_dev.ko \
    aoc_control_dev.ko \
    aoc_core.ko \
    aoc_usb_driver.ko \
    aoc_uwb_platform_drv.ko \
    aoc_uwb_service_dev.ko \
    arm-memlat-mon.ko \
    arm_dsu_pmu.ko \
    at24.ko \
    audiometrics.ko \
    bbd.ko \
    bc_max77759.ko \
    bcm47765.ko \
    bcm_dbg.ko \
    bigocean.ko \
    boot_device_spi.ko \
    clk_exynos.ko \
    cmupmucal.ko \
    cp_thermal_zone.ko \
    cpif.ko \
    dbgcore-dump.ko \
    debug-reboot.ko \
    debug-snapshot-debug-kinfo.ko \
    debug-snapshot-qd.ko \
    debug-snapshot-sfrdump.ko \
    dss.ko \
    dw3000.ko \
    dwc3-exynos-usb.ko \
    ect_parser.ko \
    eh.ko \
    exynos-acme.ko \
    exynos-adv-tracer-s2d.ko \
    exynos-adv-tracer.ko \
    exynos-bcm_dbg-dump.ko \
    exynos-bts.ko \
    exynos-btsopsgs101.ko \
    exynos-coresight-etm.ko \
    exynos-coresight.ko \
    exynos-cpuhp.ko \
    exynos-cpupm.ko \
    exynos-debug-test.ko \
    exynos-dm.ko \
    exynos-drm.ko \
    exynos-ecc-handler.ko \
    exynos-pd-dbg.ko \
    exynos-pd.ko \
    exynos-pd_el3.ko \
    exynos-pm.ko \
    exynos-pmu-if.ko \
    exynos-reboot.ko \
    exynos-seclog.ko \
    exynos_devfreq.ko \
    exynos_dit.ko \
    exynos_mct.ko \
    exynos_mfc.ko \
    exynos_pm_qos.ko \
    exynos_tty.ko \
    exyswd-rng.ko \
    g2d.ko \
    goodixfp.ko \
    google-battery.ko \
    google-bms.ko \
    google-charger.ko \
    google-cpm.ko \
    google_dual_batt_gauge.ko \
    governor_memlat.ko \
    gpu_cooling.ko \
    gs-chipid.ko \
    gs101-itmon.ko \
    google_bcl.ko \
    gs101_spmic_thermal.ko \
    gs101_thermal.ko \
    gs_acpm.ko \
    gsa.ko \
    gsa_gsc.ko \
    gsc-spi.ko \
    gvotable.ko \
    hardlockup-debug.ko \
    hardlockup-watchdog.ko \
    heatmap.ko \
    i2c-acpm.ko \
    i2c-dev.ko \
    i2c-exynos5.ko \
    keycombo.ko \
    keydebug.ko \
    logbuffer.ko \
    lzo-rle.ko \
    lzo.ko \
    mailbox-wc.ko \
    mali_kbase.ko \
    mali_pixel.ko \
    max1720x-battery.ko \
    max20339.ko \
    max77729-pmic.ko \
    max77729_charger.ko \
    max77729_uic.ko \
    max77759_charger.ko \
    max77759_contaminant.ko \
    max77759_helper.ko \
    max77826-gs-regulator.ko \
    mcps802154.ko \
    mcps802154_region_fira.ko \
    mcps802154_region_nfcc_coex.ko \
    memlat-devfreq.ko \
    nitrous.ko \
    odpm.ko \
    overheat_mitigation.ko \
    p9221.ko \
    panel-samsung-drv.ko \
    panel-samsung-emul.ko \
    panel-samsung-s6e3fc3.ko \
    panel-samsung-s6e3hc2.ko \
    panel-samsung-s6e3hc3.ko \
    panel-samsung-sofef01.ko \
    pca9468.ko \
    pcie-exynos-core.ko \
    pcie-exynos-gs101-rc-cal.ko \
    phy-exynos-mipi-dsim.ko \
    phy-exynos-mipi.ko \
    phy-exynos-usbdrd-super.ko \
    pinctrl-samsung-core.ko \
    pixel-boot-metrics.ko \
    pixel-debug-test.ko \
    pixel_stat_mm.ko \
    pixel_stat_sysfs.ko \
    pl330.ko \
    pmic_class.ko \
    power_stats.ko \
    rtc-s2mpg10.ko \
    s2mpg10-mfd.ko \
    s2mpg10-powermeter.ko \
    s2mpg10-regulator.ko \
    s2mpg11-mfd.ko \
    s2mpg11-powermeter.ko \
    s2mpg11-regulator.ko \
    s2mpg1x-gpio.ko \
    s2mpu.ko \
    s3c2410_wdt.ko \
    samsung-dma.ko \
    samsung-iommu-group.ko \
    samsung-secure-iova.ko \
    samsung_dma_heap.ko \
    samsung_iommu.ko \
    sbb-mux.ko \
    sched_tp.ko \
    sg.ko \
    shm_ipc.ko \
    sjtag-driver.ko \
    slc_acpm.ko \
    slc_dummy.ko \
    slc_pmon.ko \
    slc_pt.ko \
    slg46826.ko \
    smfc.ko \
    snd-soc-cs35l41-i2c.ko \
    snd-soc-cs35l41-spi.ko \
    snd-soc-cs35l41.ko \
    snd-soc-max98357a.ko \
    snd-soc-rl6231.ko \
    snd-soc-rt5682-i2c.ko \
    snd-soc-rt5682.ko \
    snd-soc-wm-adsp.ko \
    softdog.ko \
    spi-s3c64xx.ko \
    spidev.ko \
    sscoredump.ko \
    st21nfc.ko \
    st33spi.ko \
    st54spi.ko \
    systrace.ko \
    tcpci_fusb307.ko \
    tcpci_max77759.ko \
    touch_bus_negotiator.ko \
    touch_offload.ko \
    trusty-core.ko \
    trusty-ipc.ko \
    trusty-irq.ko \
    trusty-log.ko \
    trusty-test.ko \
    trusty-virtio.ko \
    ufs-exynos-core.ko \
    ufs-pixel-fips140.ko \
    usb_f_dm.ko \
    usb_f_dm1.ko \
    usb_f_etr_miu.ko \
    usb_psy.ko \
    usbc_cooling_dev.ko \
    vh_cgroup.ko \
    vh_fs.ko \
    vh_i2c.ko \
    vh_preemptirq_long.ko \
    vh_sched.ko \
    vh_thermal.ko \
    videobuf2-dma-sg.ko \
    xhci-exynos.ko \
    zcomp_cpu.ko \
    zcomp_eh.ko \
    zram.ko \
    zsmalloc.ko

KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/gs101/modules.load))
KERNEL_MODULES_LOAD := $(foreach m,$(KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(filter-out $(BOOT_KERNEL_MODULES), $(KERNEL_MODULES_LOAD))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(filter $(BOOT_KERNEL_MODULES), $(KERNEL_MODULES_LOAD))

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
