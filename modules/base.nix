{ config, lib, pkgs, ... }:

{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	networking.hostName = "nixxerbook";
	networking.networkmanager.enable = true;
	time.timeZone = "Europe/Warsaw";
	services.openssh.enable = true;
	systemd.tmpfiles.rules = [
		"d /bin 0755 root root -"
		"L+ /bin/bash - - - - ${pkgs.bash}/bin/bash"
	];
	environment.binsh = "/run/current-system/sw/bin/bash";
	nixpkgs.config.allowUnfree = true;
	system.stateVersion = "26.05";
}