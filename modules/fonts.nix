{ config, lib, pkgs, ... }:

{
	fonts.packages = with pkgs; [
		(nerd-fonts.jetbrains-mono)
		nerd-fonts.fira-code
		cascadia-code
		fira-code
		jetbrains-mono
		dejavu_fonts
		liberation_ttf
		cantarell-fonts
		noto-fonts
		adwaita-fonts
	];
}