{ pkgs, lib, ... }:

let
  linux = pkgs.linux_6_12;

  baseKernel = pkgs.linuxManualConfig {
    inherit (pkgs) stdenv;
    inherit (linux) src version;
    modDirVersion = "${linux.modDirVersion}-weebinux";
    configfile = ./kernel.config;
    allowImportFromDerivation = true;
  };

  kernel = lib.extendDerivation true {
    features.ia32Emulation = true;
  } baseKernel;
in
{
  boot.kernelPackages = pkgs.linuxPackagesFor kernel;
  hardware.graphics.enable32Bit = true;
}

