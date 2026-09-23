{config, pkgs, ...}:

{
  home.username = "kuba";
  home.homeDirectory = "/home/kuba";
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    colorScheme = "dark";
  };
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    adw-gtk3
    zathura
    mpv
    imv
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications =
      let
        nvimFor = mimes:
          builtins.listToAttrs (
            map (m: {
              name = m;
              value = "nvim.desktop";
            }) mimes
          );
        codeMimes = [
          "text/x-c"
          "text/x-csrc"
          "text/x-chdr"
          "text/x-c++src"
          "text/x-c++hdr"
          "text/x-objcsrc"
          "text/x-java-source"
          "text/x-java"
          "text/x-python"
          "text/x-ruby"
          "text/x-php"
          "text/css"
          "text/x-css"
          "text/javascript"
          "application/javascript"
          "application/x-javascript"
          "text/x-javascript"
          "text/x-typescript"
          "application/json"
          "text/x-json"
          "text/xml"
          "application/xml"
          "text/x-rust"
          "text/x-go"
          "text/x-sql"
          "text/x-sh"
          "text/x-shellscript"
          "application/x-shellscript"
          "text/x-makefile"
          "text/x-cmake"
          "text/x-dockerfile"
          "text/x-tex"
          "application/x-tex"
          "text/markdown"
          "text/x-markdown"
          "text/x-yaml"
          "text/x-toml"
          "text/x-ini"
          "text/x-lua"
          "text/x-haskell"
          "text/x-csharp"
          "text/x-scala"
          "text/x-kotlin"
          "text/x-swift"
          "text/x-asm"
          "text/x-patch"
          "text/x-diff"
          "text/x-perl"
          "text/x-erlang"
          "text/x-clojure"
          "text/x-lisp"
          "text/x-emacs-lisp"
          "text/x-fortran"
          "text/x-awk"
          "text/x-powershell"
          "text/x-bibtex"
          "text/x-rst"
          "text/x-org"
          "text/x-verilog"
          "text/x-vhdl"
          "text/x-zsh"
          "text/x-config"
          "text/x-log"
          "text/x-dconf"
          "text/x-gettext-translation"
          "text/x-texinfo"
          "text/csv"
          "text/tab-separated-values"
          "text/calendar"
          "text/plain"
        ];
      in
      nvimFor codeMimes
      // {
        "text/html" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/discord" = "vesktop.desktop";
      "application/pdf" = "zathura.desktop";
      "image/png" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/svg+xml" = "imv.desktop";
      "image/bmp" = "imv.desktop";
      "image/avif" = "imv.desktop";
      "video/mp4" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/ogg" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "audio/opus" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";
      "audio/x-flac" = "mpv.desktop";
      "audio/wav" = "mpv.desktop";
      "audio/x-wav" = "mpv.desktop";
      "audio/mp4" = "mpv.desktop";
      "audio/aac" = "mpv.desktop";
    };
  };

  programs.home-manager.enable = true;
}
