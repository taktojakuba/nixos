{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    targets.foot.enable = false;
    targets.cava.enable = false;

    base16Scheme = {
      base00 = "0d0d0d";
      base01 = "1a1a1a";
      base02 = "262626";
      base03 = "404040";
      base04 = "595959";
      base05 = "d9d9d9";
      base06 = "e6e6e6";
      base07 = "f2f2f2";
      base08 = "808080";
      base09 = "8c8c8c";
      base0A = "999999";
      base0B = "a6a6a6";
      base0C = "b3b3b3";
      base0D = "bfbfbf";
      base0E = "cccccc";
      base0F = "d9d9d9";
    };
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };
  };
}
