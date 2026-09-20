{ config, lib, pkgs, spotifast, ... }:

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
		zsh
		starship
		playerctl
		libnotify
		matugen
		bluetuith
    spotifast.packages."${pkgs.stdenv.hostPlatform.system}".default
    wiremix
		wbg
		fzf
	];
}
