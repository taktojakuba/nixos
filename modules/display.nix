{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.xserver = {
    enable = false;
    displayManager.lightdm.enable = false;
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
    config.common.default = [
      "gtk"
      "wlr"
    ];
  };
  services.greetd = {
    enable = true;
    settings = {
      # Auto-login as kuba on boot. This only runs once per boot.
      initial_session = {
        command = "sway --unsupported-gpu";
        user = "kuba";
      };
      # Fallback greeter: only shown if the session above exits/logs out.
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'sway --unsupported-gpu'";
        user = "kuba";
      };
    };
  };
}
