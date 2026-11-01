{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.sway.enable = true;
  programs.xwayland.enable = true;

  # Qt apps prefer Wayland and fall back to XWayland when the app has no
  # Wayland plugin. The cursor variables match home/gtk.nix and apply to
  # Wayland/XWayland clients too; the last line keeps Java/AWT apps
  # (JetBrains) sane.
  programs.sway.extraSessionCommands = ''
    export QT_QPA_PLATFORM="wayland;xcb"
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export _JAVA_AWT_WM_NONREPARENTING=1
    export XCURSOR_THEME="Bibata-Modern-Ice"
    export XCURSOR_SIZE=24
  '';

  # GTK settings (theme, fonts, icons) are stored in dconf; the xdg portals
  # need it as well. The portals themselves (gtk + wlr, screencast/screenshot
  # via wlr) are set up by display.nix and programs.sway.
  programs.dconf.enable = true;

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  hardware.graphics.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  console.keyMap = "us";

  # grim and wmenu come from programs.sway's defaults.
  environment.systemPackages = with pkgs; [
    cliphist
    desktop-file-utils
    gsettings-desktop-schemas
    noctalia
    slurp
    #swaybg
    swayimg
    #wbg
    wf-recorder
    wl-clipboard
    wlr-randr
  ];
}
