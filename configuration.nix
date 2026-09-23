{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
    ./modules/bootloader.nix
		./modules/base.nix
		./modules/hardware.nix
		./modules/nvidia.nix
		./modules/display.nix
		./modules/fonts.nix
		./modules/user.nix
		./modules/dev.nix
		./modules/docker.nix
		./modules/apps.nix
		./modules/dwl.nix
		./modules/games.nix
		./modules/gtk.nix
		./modules/wm.nix
	];
}
