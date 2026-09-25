{ config, pkgs, ...}: {
  imports = [ ../apps/zsh.nix ];

  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
}
