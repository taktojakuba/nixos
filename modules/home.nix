{ config, pkgs, ... }:

{
  home.username = "kuba";
  home.homeDirectory = "/home/kuba";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
