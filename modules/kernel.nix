{ pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;

  boot.kernelParams = [
    "nvme_core.default_ps_max_latency_us=0"
    "pcie_aspm=off"
  ];
}
