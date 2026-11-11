{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.bootvine.enable = true;
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];
}
