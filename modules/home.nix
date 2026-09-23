{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.my_username = {
    home.stateVersion = "18.09";
    programs.zsh = {
      shellAliases = {
        alias vim="nvim";
        alias tmux="tmux attach || tmux new";
        alias rebuild="sudo nixos-rebuild switch --flake .#nixasus";
        alias y="yazi";
        alias ga="git add .";
        alias gi="git init";
        alias gc="git commit -m";
        alias gp="git push";
        alias gs="git status";
        alias gu="git pull";
        alias mkdir="mkdir -p";
        alias gpp="g++";
        alias ls="ls -ah --color=always --group-directories-first";
        alias opencode="nix run nixpkgs#opencode --extra-experimental-features nix-command --extra-experimental-features flakes";
        cs() { cd "$@" && ls; };
        alias cd="cs";
      }
    }
  };
}
