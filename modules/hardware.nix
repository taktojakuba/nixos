{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.enableRedistributableFirmware = true;

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
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
