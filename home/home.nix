{ config, pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./foot.nix
    ./cava.nix
  ];

  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
}
