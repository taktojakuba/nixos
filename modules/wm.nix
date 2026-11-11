{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    sway
    noctalia
    cliphist
    libdrm
    libxcb
    libxkbcommon
    pixman
    wayland
    wayland-protocols
    wf-recorder
    wl-clip-persist
    wl-clipboard
    wlr-randr
    wlroots
    xkbcomp
    xwayland
  ];
}
