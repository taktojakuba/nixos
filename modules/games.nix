{
  config,
  lib,
  pkgs,
  ...
}:

{

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
  };

}
