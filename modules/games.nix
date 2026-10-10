{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.graphics.enable32Bit = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraPackages = with pkgs; [
      gamemode
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  environment.systemPackages = with pkgs; [
    protontricks
    wine
    wine-staging
    winetricks
    protonplus
  ];
}
