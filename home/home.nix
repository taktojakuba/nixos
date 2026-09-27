{ config, pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./foot.nix
    ./cava.nix
    ./btop.nix
    ./dunst.nix
    ./rofi.nix
    ./tmux.nix
    ./yazi.nix
    ./stylix.nix
  ];

  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
}
