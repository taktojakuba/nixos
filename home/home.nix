{ config, pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./foot.nix
    ./cava.nix
    ./btop.nix
    ./dunst.nix
    ./tmux.nix
    ./yazi.nix
    ./vesktop.nix
    ./nvim.nix
    ./justbar.nix
    ./stylix.nix
  ];

  home = {
    username = "kuba";
    homeDirectory = "/home/kuba";
    stateVersion = "26.05";
  };
}
