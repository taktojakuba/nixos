{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.sway.enable = true;
  programs.xwayland.enable = true;
  programs.sway.extraSessionCommands = ''
    export QT_QPA_PLATFORM="wayland;xcb"
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export _JAVA_AWT_WM_NONREPARENTING=1
    export XCURSOR_THEME="Bibata-Modern-Ice"
    export XCURSOR_SIZE=24
  '';

  programs.dconf.enable = true;

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  hardware.graphics.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  console.keyMap = "us";

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
