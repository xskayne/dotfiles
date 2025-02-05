{
  description = "Basic NixOS installation media";

  inputs = {
    # define the URL for the nixpkgs repository (stable channel)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        # define the NixOS configuration for the ISO image
        iso = nixpkgs.lib.nixosSystem {
          modules = [
            # include the main system configuration file
            ./configuration.nix
          ];
        };
      };
    };
}
