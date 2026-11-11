{ config, pkgs, ... }: {
  imports = [
    ./bash.nix
  ];

  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
}
