{
  config,
  lib,
  pkgs,
  ...
}:

{

  programs.dconf.enable = true;
  networking.networkmanager.enable = true;
  services.upower.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  console.keyMap = "us";

  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
  };

  services.scx-loader = {
    enable = true;
    config = {
      default_sched = "scx_bpfland";
    };
  };
}
