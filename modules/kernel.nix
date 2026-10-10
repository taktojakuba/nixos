{ pkgs, ... }:

let
  version = "7.2.9";
  kernel = pkgs.linuxManualConfig {
    inherit (pkgs) stdenv;
    src = /home/kuba/Projects/linux-7.2.9;
    inherit version;
    modDirVersion = "${version}-weebinux";

    configfile = ./kernel.config;
    allowImportFromDerivation = true;
  };
in
{
  boot.kernelPackages = pkgs.linuxPackagesFor kernel;
}

