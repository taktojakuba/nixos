{ config, pkgs, ... }: {
  programs.cava.enable = true;
  programs.cava.settings = {
    general = {
      framerate = 24;
      sensitivity = 60;
      autosens = 2; # 1 - normal/2 - aggresive/ 0 - off
      bars = 0; # 0 = auto, fills terminal width and re-fits on resize
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
      foreground = "'#b3b3b3'";
    };
    output = {
      method = "ncurses";
      channels = "mono";
      mono_option = "average";
      orientation = "bottom";
    };
  };
}
