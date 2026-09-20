{
  description = "nixasus configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  outputs = { self, nixpkgs }: {
      nixosConfigurations.nixasus = nixpkgs.lib.nixosSystem {
          modules = [ ./configuration.nix ];
    };
  };
}
