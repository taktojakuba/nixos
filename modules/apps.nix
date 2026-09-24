{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
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
    cava
	];
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/kuba/nixos"; # sets NH_OS_FLAKE variable for you
  };
}
