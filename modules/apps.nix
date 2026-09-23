{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		qutebrowser
    firefox
    pywalfox-native
    vesktop
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
    mpv 
    imv
    zathura
		zsh
		starship
		playerctl
		libnotify
		matugen
		bluetuith
    spotify
    wiremix
		wbg
		fzf
	];
}
