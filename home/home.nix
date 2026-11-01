{ config, pkgs, ... }: {
  imports = [
    ./bash.nix
    ./cava.nix
    ./gtk.nix
    ./nixvim.nix
  ];

  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
}
