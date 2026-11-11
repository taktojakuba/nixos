{
  description = "thinknix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    bootvine.url = "git+https://codeberg.org/wvhulle/bootvine";
    bootvine.inputs.nixpkgs.follows = "nixpkgs";

  };
  outputs =
    {
      nixpkgs,
      home-manager,
      bootvine,
      nvf,
      ...
    }:
    {
      nixosConfigurations.thinknix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          bootvine.nixosModules.default
          nvf.nixosModules.default
          ./configuration.nix
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
