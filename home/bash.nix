{ config, pkgs, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      PS1='\[\e[97m\]\u@\h:\w\$ \[\e[0m\]'
      jf
      cs() {
        builtin cd "$@" && ls
      }

      memof() {
        local pid
        pid=$(pidof "$1") || return 1
        awk '/^Pss:/ {printf "%.2f MiB\n", $2/1024}' "/proc/$pid/smaps_rollup"
      }
    '';

    shellAliases = {
      rebuild-home = "nh home switch";
      rebuild = "nh os switch";

      vim = "nvim";

      ga = "git add .";
      gi = "git init";
      gc = "git commit -m";
      gp = "git push";
      gs = "git status";
      gu = "git pull";

      mkdir = "mkdir -p";
      cd = "cs";

      gpp = "g++";

      ls = "ls -Alh --color=auto --group-directories-first";

      opencode = "nix run nixpkgs#opencode --extra-experimental-features nix-command --extra-experimental-features flakes";
    };
  };
}
