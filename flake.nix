{
  description = "thinknix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      nvf,
      nix-flatpak,
      ...
    }:
    {
      nixosConfigurations.thinknix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nvf.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
          ./configuration.nix
          ./modules/flatpak.nix
        ];
      };

      homeConfigurations.kuba = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./home/home.nix
        ];
      };
    };
}
