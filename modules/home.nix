{ config, pkgs, ...}: {
  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
    };
  };
}
