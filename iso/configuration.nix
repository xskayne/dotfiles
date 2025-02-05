{ pkgs, modulesPath, ... }:

{
  # import the graphical GNOME installation CD module
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-gnome.nix"
  ];

  # set the kernel packages to the latest available version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # set the hostname for the system (used for identification)
  networking.hostName = "iso";

  nixpkgs = {
    # define the host platform architecture (x86_64-linux for 64-bit systems)
    hostPlatform = "x86_64-linux";

    # allow unfree packages to be installed (e.g., proprietary software)
    config.allowUnfree = true;
  };

  # define the system packages to be installed
  environment.systemPackages = with pkgs; [
    git # Git version control system
  ];

  nix = {
    settings = {
      # enable experimental features for Nix (nix-command and flakes)
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
