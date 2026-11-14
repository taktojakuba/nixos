{
  services.flatpak = {
    enable = true;
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];
    packages = [ "flathub:app/com.bambulab.BambuStudio//stable" ];
  };
}
