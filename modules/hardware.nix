{ config, lib, pkgs, ... }:

{
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = false;
	services.libinput.enable = true;
	services.power-profiles-daemon.enable = true;
}