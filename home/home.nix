{ config, pkgs, ... }: {
  imports = [
    ./bash.nix
    ./nixvim.nix
  ];

  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
}
