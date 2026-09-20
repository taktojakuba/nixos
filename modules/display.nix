{ config, lib, pkgs, ... }:

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
				command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd /home/kuba/dwl/scripts/launch.sh";
				user = "greeter";
			};
		};
	};
}