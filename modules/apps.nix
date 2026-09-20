{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		qutebrowser
		bitwarden-cli
		wget
		rsync
		unzip
		zip
		p7zip
		brightnessctl
		foot
		btop
		fastfetch
		tmux
		yazi
		zsh
		starship
		playerctl
		libnotify
		matugen
		bluetuith
		wbg
		fzf
	];
}