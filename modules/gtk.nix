{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    adw-gtk3
    dconf
    desktop-file-utils
    glib
    gobject-introspection
    gsettings-desktop-schemas
    gtk3
    gtk4
    gtkmm3
    gtkmm4
    libadwaita
    vala
  ];
}
