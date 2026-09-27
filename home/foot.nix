{ config, pkgs, ... }: {
  programs.foot = {
    enable = true;

    settings = {
      main.font = "Adwaita Mono:size=11";

      colors-dark = {
        alpha = "1.0";

        cursor = "a3a3a3 ececec";

        # Base UI colors
        foreground = "ececec";
        background = "181818";
        selection-foreground = "1a1a1a";
        selection-background = "999999";
        urls = "b3b3b3";

        regular0 = "4c4c4c"; # black
        regular1 = "ac8a8c"; # red
        regular2 = "8aac8b"; # green
        regular3 = "aca98a"; # yellow
        regular4 = "b3b3b3"; # blue
        regular5 = "ac8aac"; # magenta
        regular6 = "8aacab"; # cyan
        regular7 = "f0f0f0"; # white

        # Bright colors
        bright0 = "262626"; # bright black
        bright1 = "c49ea0"; # bright red
        bright2 = "9ec49f"; # bright green
        bright3 = "c4c19e"; # bright yellow
        bright4 = "a39ec4"; # bright blue
        bright5 = "c49ec4"; # bright magenta
        bright6 = "9ec3c4"; # bright cyan
        bright7 = "e7e7e7"; # bright white
      };
    };
  };
}
