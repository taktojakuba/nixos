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
}
