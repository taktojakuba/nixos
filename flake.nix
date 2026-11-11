{
  description = "thinknix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    bootvine.url = "git+https://codeberg.org/wvhulle/bootvine";
    bootvine.inputs.nixpkgs.follows = "nixpkgs";

  };
  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      bootvine,
      ...
    }:
    {
      nixosConfigurations.thinknix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          bootvine.nixosModules.default
          ./configuration.nix
        ];
      };

      homeConfigurations.kuba = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          nixvim.homeModules.nixvim
          ./home/home.nix
        ];
      };
    };
}
