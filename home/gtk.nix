{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    # Dark everywhere: GTK3 apps get the dark adw-gtk3 theme, and
    # colorScheme = "dark" tells libadwaita/GTK4 apps to prefer dark too.
    colorScheme = "dark";
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    # Stock Adwaita icons.
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  # Minimalistic cursor theme. Applied to GTK apps here, and exported as
  # XCURSOR_THEME/XCURSOR_SIZE for Wayland/XWayland clients.
  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = false;
  };
}
