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
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;
  # The actual portal backends (gtk + wlr, with screencast/screenshot routed
  # to wlr on sway) are installed by programs.sway; this is the fallback used
  # when no session-specific portal config matches.
  xdg.portal = {
    enable = true;
    config.common.default = [
      "gtk"
      "wlr"
    ];
  };
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'sway'";
        user = "kuba";
      };
    };
  };
}
