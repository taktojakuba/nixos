{ config, pkgs, ... }: {
  programs.cava.settings = {
    general.framerate = 24;
    smoothing_noise_reduction = 50;
    sensitivity = 100;
    autosens = 1; # 1 - normal/2 - aggresive/ 0 - off
    scaling = linear; #decibel
    bars = 8;
    bar_width = 2;
    bar_spacing = 1;
    center_align = 1;
    color = {
      background = "'default'";
      foreground = "'#b3b3b3'";
    };
  }
}
