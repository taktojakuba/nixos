{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
  hardware.opentabletdriver.enable = false;
  zramSwap.enable = true;
  zramSwap.memoryPercent = 25;
  services.scx = {
    enable = false;
    scheduler = "scx_cosmos";
  };
  # Second games disk (sda, ext4, labeled "ssdgames")
  fileSystems."/ssd" = {
    device = "/dev/disk/by-label/ssdgames";
    fsType = "ext4";
    options = [
      "rw"
      "relatime"
    ];
  };
}
