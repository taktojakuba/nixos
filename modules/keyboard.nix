{ config, pkgs, ... }:

{
  services.xserver.xkb = {
    options = "caps:super,grp:win_space_toggle";
  };
}
