{ config, lib, pkgs, ... }:

{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	networking.hostName = "nixxerbook";
	networking.networkmanager.enable = true;
	time.timeZone = "Europe/Warsaw";
	services.openssh.enable = true;
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "26.05";
}