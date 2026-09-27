{ lib, ... }:
{
  systemd.user.services.dunst.Service.Environment = lib.mkForce [ "DISPLAY=:0" ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        border-size = 1;
        border-radius = 0;

        width = 360;
        padding = 5;
        margin = 20;
        anchor = "top-right";

        icons = 0;

        default-timeout = 10000;
        ignore-timeout = 0;
        max-visible = 5;
        sort = "-time";
        layer = "overlay";

        format = "<b>%s</b>\\n%b";
        markup = 1;
        group-by = "app-name";
      };

      "mode=do-not-disturb" = {
        invisible = 1;
        on-notify = "none";
      };

      "mode=silent" = {
        on-notify = "none";
      };
    };
  };
}
