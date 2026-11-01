{
  config,
  lib,
  pkgs,
  ...
}:

{

  # 64-bit, Wayland-native gaming tools only.
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
  };

}
