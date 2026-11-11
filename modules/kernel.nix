{ pkgs, ... }:

let
  version = "7.4-rc2";

  kernel = pkgs.linuxManualConfig {
    inherit (pkgs) stdenv;
    inherit version;
    modDirVersion = "7.4.0-rc2-weebinux";
    src = pkgs.fetchurl {
      url = "https://github.com/torvalds/linux/archive/refs/tags/v${version}.tar.gz";
      hash = "sha256-AQBj1fx7s6Xx+xFs/0Wr5Jd+ioIFt4QXc1BWgMegFLs=";
    };
    configfile = ./kernel.config;
    allowImportFromDerivation = true;
  };
in
{
  boot.kernelPackages = pkgs.linuxPackagesFor kernel;
  boot.initrd.includeDefaultModules = false;
  boot.initrd.allowMissingModules = true;
  boot.kernelParams = [
    "nvme_core.default_ps_max_latency_us=0"
    "pcie_aspm=off"
  ];
}
