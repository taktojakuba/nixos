{ pkgs, lib, ... }:

let
  version = "7.2.11";

  baseKernel = pkgs.linuxManualConfig {
    inherit (pkgs) stdenv;
    inherit version;
    modDirVersion = "${version}-weebinux";
    src = pkgs.fetchurl {
      url = "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${version}.tar.xz";
      hash = "sha256-/Q/EefmDqMBTE/E+nDYzD+ZlHPclOWdIxA1c2T+h5qQ=";
    };
    configfile = ./kernel.config;
    allowImportFromDerivation = true;
  };

  kernel = lib.extendDerivation true {
    features.ia32Emulation = true;
  } baseKernel;
in
{
  boot.kernelPackages = pkgs.linuxPackagesFor kernel;
  boot.initrd.includeDefaultModules = false;
  boot.initrd.allowMissingModules = true;
  hardware.graphics.enable33Bit = true;
  boot.kernelParams = [
    "nvme_core.default_ps_max_latency_us=0"
    "pcie_aspm=off"
  ];
}
