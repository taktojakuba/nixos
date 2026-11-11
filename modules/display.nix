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
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'weebwl'";
        user = "kuba";
      };
    };
  };
}
