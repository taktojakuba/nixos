{
  programs.rofi = {
    enable = true;
    settings = {
      modes = "drun,run,window";
      show-icons = false;
      drun-display-format = "{name}";
      disable-history = true;
      lines = 5;
      hide-scrollbar = true;
    };
    theme = {
      "element.normal.normal" = {
        background = "@background";
      };
      "element.alternate.normal" = {
        background = "@background";
      };
    };
  };
}
