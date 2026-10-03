{
  config,
  lib,
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [
    adwaita-fonts
    cantarell-fonts
    cascadia-code
    dejavu_fonts
    fira-code
    jetbrains-mono
    liberation_ttf
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
}
