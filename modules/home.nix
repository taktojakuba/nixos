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
  programs.home-manager.enable = true;
}
