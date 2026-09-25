{ config, pkgs, ...}: {
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "direnv" "docker" ];
      theme = "minimal";
    };
    initContent = "
      cs() { cd \"$@\" && ls; }
      memof() {
      pid=$(pidof \"$1\")
      grep '^Pss:' /proc/$pid/smaps_rollup | awk '{printf '%.2f MiB\n', $2/1024}'
      }
    ";
    shellAliases = {
      rebuild-home = "nh home switch";
      rebuild = "nh os switch";
      vim = "nvim";
      ga="git add .";
      gi="git init";
      gc="git commit -m";
      gp="git push";
      gs="git status";
      gu="git pull";
      mkdir="mkdir -p";
      cd="cs";
      gpp="g++";
      ls="ls -ah --color=always --group-directories-first";
      opencode="nix run nixpkgs#opencode --extra-experimental-features nix-command --extra-experimental-features flakes";
    };
  };
}
