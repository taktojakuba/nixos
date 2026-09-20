{ config, lib, pkgs, ... }:

{
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		extraPackages = with pkgs; [
			gamemode
		];
	};

	programs.gamemode.enable = true;

	environment.systemPackages = with pkgs; [
		wine
		wine-staging
		winetricks
		protontricks
	];
}