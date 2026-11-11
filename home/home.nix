{ config, pkgs, ... }: {
  imports = [
    ./bash.nix
    ./gtk.nix
  ];

  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
}
