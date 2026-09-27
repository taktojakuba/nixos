{
  programs.rofi = {
    enable = true;
    extraConfig = {
      modes = "drun,run,window";
      font = "mono 12";
      show-icons = false;
      drun-display-format = "{name}";
      disable-history = true;
    };
  };
}
