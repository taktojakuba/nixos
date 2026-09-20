{
  description = "nixasus configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spotifast.url = "github:crmne/spotifast";
  };
  outputs = { self, nixpkgs, spotifast }: {
    nixosConfigurations.nixasus = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit spotifast; };
      modules = [ ./configuration.nix ];
    };
  };
}
