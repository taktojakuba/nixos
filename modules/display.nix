{ config, lib, pkgs, ... }:

let
	dwlLaunch = pkgs.writeShellScriptBin "dwl-launch" ''
		export XCURSOR_THEME=Future-dark-cursors
		export XCURSOR_SIZE=24
		export XDG_CURRENT_DESKTOP=dwl:wlroots
		export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
		export WLR_RENDERER=gles2
		exec ${config.programs.dwl.package}/bin/dwl -s /home/kuba/dwl/scripts/autostart.sh
	'';
in
{
	services.xserver = {
		enable = false;
		displayManager.lightdm.enable = false;
	};
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};
	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
		config.common.default = [ "gtk" "wlr" ];
	};
	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${dwlLaunch}/bin/dwl-launch";
				user = "greeter";
			};
		};
	};
}