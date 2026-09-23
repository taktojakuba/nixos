{ config, lib, pkgs, ... }:

{
	networking.hostName = "nixasus";
	networking.networkmanager.enable = true;
	time.timeZone = "Europe/Warsaw";
	services.openssh.enable = true;
	systemd.tmpfiles.rules = [
		"d /bin 0755 root root -"
		"L+ /bin/bash - - - - ${pkgs.bash}/bin/bash"
	];
	environment.binsh = "/run/current-system/sw/bin/bash";
	nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "26.05";
}
