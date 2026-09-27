{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		dunst
		rofi
		wl-clipboard
		wl-clip-persist
		cliphist
		grim
		slurp
		wf-recorder
		wlr-randr
		ironbar
		wayland
		wayland-protocols
		wlroots
		libxkbcommon
		pixman
		libdrm
		libxcb
		xwayland
		xkbcomp
	];
}
