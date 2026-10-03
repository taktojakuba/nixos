{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    bambu-studio
    bitwarden-cli
    bluetuith
    brightnessctl
    btop
    cava
    fastfetch
    firefox
    foot
    fzf
    imv
    jetbrains.idea
    jetbrains.webstorm
    vscode
    libnotify
    matugen
    mpv
    p7zip
    playerctl
    qutebrowser
    rsync
    spotify
    tmux
    unzip
    vesktop
    wbg
    wget
    wiremix
    yazi
    zathura
    zip
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/kuba/nixos"; # sets NH_OS_FLAKE variable for you
  };
}
