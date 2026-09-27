{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = {
      base00 = "111111";
      base01 = "181818";
      base02 = "2c2c2c";
      base03 = "444444";
      base04 = "666666";
      base05 = "ececec";
      base06 = "ececec";
      base07 = "ececec";
      base08 = "d9d9d9";
      base09 = "cccccc";
      base0A = "d1d1d1";
      base0B = "b3b3b3";
      base0C = "9e9e9e";
      base0D = "b3b3b3";
      base0E = "999999";
      base0F = "8a8a8a";
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

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
}
