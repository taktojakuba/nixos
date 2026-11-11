{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    bluetuith
    brightnessctl
    btop
    cava
    firefox
    foot
    fzf
    imv
    vscode
    libnotify
    matugen
    mpv
    p7zip
    playerctl
    rsync
    spotify
    vesktop
    tmux
    unzip
    wget
    wiremix
    yazi
    zathura
    zip
    tokei
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/kuba/nixos"; # sets NH_OS_FLAKE variable for you
  };
}
