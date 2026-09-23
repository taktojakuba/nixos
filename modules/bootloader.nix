{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.loader.limine.enable = true;
  boot.loader.limine.resolution = "1920x1080x32";
  boot.loader.limine.enableEditor = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.limine.style = {
    wallpapers = [ ];
    backdrop = "000000";
    interface.helpHidden = true;
    graphicalTerminal = {
      margin = 0;
      marginGradient = 0;
    };
  };
}
