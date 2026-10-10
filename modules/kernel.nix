# weebinux-tweaks.nix
# Trims the stock NixOS kernel config: tighter tick/CPU-count defaults,
# drops unused LSMs/debug symbols, and removes exotic hypervisor-guest,
# network, filesystem and media drivers not in use on this machine.
#
# Import this from your configuration.nix, e.g.:
#   imports = [ ./weebinux-tweaks.nix ];
#
# After rebuilding, double check with:
#   zcat /proc/config.gz | grep CONFIG_SYMBOL_NAME
{ ... }:

{
  boot.kernelPatches = [{
    name = "weebinux-tweaks";
    patch = null;
    # Some symbols below (e.g. LIVEUPDATE, KEXEC_HANDOVER, AMD_ATL_PRM) are
    # very new and may not exist in the kernel version NixOS actually
    # builds. ignoreConfigErrors keeps those mismatches from hard-failing
    # the build instead of erroring out.
    ignoreConfigErrors = true;
    extraConfig = ''
    NO_HZ_IDLE y
    NO_HZ_FULL n
    MAXSMP n
    NR_CPUS 64
    X86_X32_ABI n
    KEXEC_HANDOVER n
    LIVEUPDATE n
    DAMON n
    XEN n
    HYPERV n
    JAILHOUSE_GUEST n
    ACRN_GUEST n
    BHYVE_GUEST n

    SECURITY_SELINUX n
    SECURITY_SMACK n
    SECURITY_TOMOYO n
    SECURITY_APPARMOR n
    SECURITY_LOADPIN n
    SECURITY_IPE n
    SECURITY_SAFESETID n

    DYNAMIC_DEBUG n
    DEBUG_RODATA_TEST n
    X86_DECODER_SELFTEST n
    DEBUG_BOOT_PARAMS n
    DEBUG_SHIRQ n
    DEBUG_MEMORY_INIT n
    MEMTEST n
    SHRINKER_DEBUG n
    LOCK_EVENT_COUNTS n
    X86_CPA_STATISTICS n
    PM_DEBUG n
    ACPI_DEBUG n
    PNP_DEBUG_MESSAGES n
    FW_LOADER_DEBUG n
    SND_DEBUG n
    DM_DEBUG n
    BLK_DEBUG_FS n
    SUNRPC_DEBUG n
    NFS_DEBUG n
    CIFS_DEBUG n
    NETFS_DEBUG n
    DLM_DEBUG n
    NTFS_DEBUG n
    CFG80211_DEBUGFS n
    MAC80211_DEBUGFS n
    BT_DEBUGFS n
    ATH5K_DEBUG n
    ATH6KL_DEBUG n
    ATH9K_COMMON_DEBUG n
    ATH9K_DEBUGFS n
    ATH9K_HTC_DEBUGFS n
    ATH10K_DEBUG n
    ATH10K_DEBUGFS n
    ATH11K_DEBUG n
    ATH11K_DEBUGFS n
    ATH12K_DEBUG n
    ATH12K_DEBUGFS n
    BRCMDBG n
    IWLWIFI_DEBUG n
    IWLWIFI_DEBUGFS n
    IWLEGACY_DEBUG n
    IWLEGACY_DEBUGFS n
    RTLWIFI_DEBUG n
    RTW88_DEBUG n
    RTW88_DEBUGFS n
    RTW89_DEBUG n
    RTW89_DEBUGMSG n
    RTW89_DEBUGFS n
    RT2X00_LIB_DEBUGFS n
    RSI_DEBUGFS n
    CARL9170_DEBUGFS n
    WIL6210_DEBUGFS n
    WCN36XX_DEBUGFS n
    B43LEGACY_DEBUG n

    STAGING n
    INFINIBAND n
    NFC n
    CAN n
    ATM n
    IEEE802154 n
    6LOWPAN n
    BATMAN_ADV n
    TIPC n
    RDS n
    ATALK n
    PHONET n
    HSR n
    NET_DSA n
    QRTR n
    AF_RXRPC n
    AF_KCM n
    L2TP n
    OPENVSWITCH n
    MCTP n
    IP_VS n
    FDDI n
    WWAN n
    NET_VENDOR_MELLANOX n
    NET_VENDOR_CHELSIO n
    NET_VENDOR_CAVIUM n
    NET_VENDOR_QLOGIC n
    NET_VENDOR_EMULEX n
    NET_VENDOR_NETRONOME n
    NET_VENDOR_SOLARFLARE n
    NET_VENDOR_PENSANDO n
    NET_VENDOR_FUNGIBLE n
    NET_VENDOR_HUAWEI n
    NET_VENDOR_GOOGLE n
    NET_VENDOR_AMAZON n
    NET_VENDOR_MICROSOFT n
    NET_VENDOR_META n
    NET_VENDOR_BROCADE n
    NET_VENDOR_MYRI n

    GPIB n
    MOST n
    FPGA n
    NTB n
    COUNTER n
    CHROME_PLATFORMS n
    SURFACE_PLATFORMS n
    MELLANOX_PLATFORM n
    PCCARD n
    PARPORT n
    MTD n
    FIREWIRE n
    MACINTOSH_DRIVERS n
    SPEAKUP n
    SIOX n
    SLIMBUS n
    IPACK_BUS n
    MCB n
    STM n
    INTEL_TH n
    GNSS n
    MEDIA_DIGITAL_TV_SUPPORT n
    MEDIA_ANALOG_TV_SUPPORT n
    MEDIA_RADIO_SUPPORT n
    MEDIA_TEST_SUPPORT n
    DRM_ACCEL_HABANALABS n
    DRM_ACCEL_QAIC n
    DRM_GMA500 n
    DRM_GUD n
    DRM_HISI_HIBMC n
    DRM_UDL n

    JFS_FS n
    OCFS2_FS n
    GFS2_FS n
    NILFS2_FS n
    ZONEFS_FS n
    ORANGEFS_FS n
    AFFS_FS n
    ECRYPT_FS n
    BEFS_FS n
    JFFS2_FS n
    UBIFS_FS n
    CRAMFS n
    MINIX_FS n
    OMFS_FS n
    ROMFS_FS n
    UFS_FS n
    CODA_FS n
    AFS_FS n
    CEPH_FS m
    CEPH_LIB m
    '';
  }];
}
