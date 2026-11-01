{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Firmware for Intel WiFi/Bluetooth and the Iris Xe GPU, and this also makes
  # hardware.cpu.intel.updateMicrocode (see hardware-configuration.nix) apply.
  hardware.enableRedistributableFirmware = true;

  hardware.graphics.enable = true;
  # Re-enable 32-bit graphics support (Mesa 32-bit driver), needed by 32-bit apps.
  hardware.graphics.enable32Bit = true;
  # VA-API driver for the Intel Iris Xe iGPU (hardware video decode/encode).
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;

  # Drawing tablet support, including udev rules, the daemon user service and
  # blacklisting the conflicting wacom/hid-uclogic kernel modules.
  hardware.opentabletdriver.enable = true;
}
