{ config, ... }:
{
  programs.cava.enable = true;
  programs.cava.settings = {
    general = {
      framerate = 24;
      sensitivity = 60;
      autosens = 2;
      bars = 0;
      bar_spacing = 3;
      lower_cutoff_freq = 60;
      higher_cutoff_freq = 10000;
    };
    smoothing = {
      monstercat = 1;
      noise_reduction = 20;
      waves = 0;
    };
    color = {
      background = "'default'";
      foreground = "'${config.lib.stylix.colors.withHashtag.base05}'";
    };
    output = {
      method = "ncurses";
      channels = "mono";
      mono_option = "average";
      orientation = "bottom";
    };
  };
}
