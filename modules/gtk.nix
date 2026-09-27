{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		gtk3
    adw-gtk3
		gtk4
		libadwaita
		gtkmm3
		gtkmm4
		glib
		dconf
		gobject-introspection
		gsettings-desktop-schemas
		desktop-file-utils
		vala
	];
}
