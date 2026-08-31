{ pkgs ? import <nixpkgs> {} }:

let
	wlroots' = pkgs.wlroots;
in
pkgs.mkShell {
	buildInputs = with pkgs; [
		gcc
		gnumake
		pkg-config
		wayland
		wayland-protocols
		wayland-scanner
		wlroots'
		libinput
		libxkbcommon
		pixman
		libdrm
		mesa
	];

	shellHook = ''
		v=$(${pkgs.pkg-config}/bin/pkg-config --modversion wlroots-0.20 2>/dev/null \
			|| ${pkgs.pkg-config}/bin/pkg-config --modversion wlroots 2>/dev/null \
			|| echo "none")
		wl=${toString wlroots'}
		echo "wayland: $v"
		echo "wlroots: '$wl'"
	'';
}

