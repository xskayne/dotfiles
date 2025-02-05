{
  description = "NixOS Configuration";

  inputs = {
    # define the URL for nixpkgs (unstable channel)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # define the URL for the stable nixpkgs channel
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    # define the URL for the catppuccin theme repository
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      # define the URL for the home-manager repository (used for user configuration management)
      url = "github:nix-community/home-manager";

      # ensure home-manager follows the nixpkgs input for consistent updates
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      # inputs passed into the outputs function
      nixpkgs,
      catppuccin,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        ranni =
          let
            # define the username for this configuration
            username = "shane";

            # pass the username as a special argument
            specialArgs = { inherit username; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            # define the system architecture (x86_64-linux)
            system = "x86_64-linux";

            # list of modules to be included in the system configuration
            modules = [
              # include the host-specific configuration for ranni
              ./hosts/ranni/configuration.nix

              # include the catppuccin theme module
              catppuccin.nixosModules.catppuccin

              # include home-manager modules and configure them
              home-manager.nixosModules.home-manager
              {
                # pass the username to home-manager as an argument
                home-manager.extraSpecialArgs = { inherit username; };

                # enable global packages for home-manager
                home-manager.useGlobalPkgs = true;

                # enable user-specific packages for home-manager
                home-manager.useUserPackages = true;

                # set the file extension for home-manager backup files
                home-manager.backupFileExtension = "rebuild";

                # configure the user account for home-manager
                home-manager.users.${username} = {
                  # include the user's home directory configuration
                  imports = [
                    ./users/${username}/home.nix

                    # include the catppuccin theme for the user in home-manager
                    catppuccin.homeManagerModules.catppuccin
                  ];
                };
              }
            ];
          };
      };
    };
}
