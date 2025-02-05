{ pkgs, ... }:

{
  # import system and i3 configuration modules, and hardware configuration
  imports = [
    ../../modules/system.nix # system-specific configuration
    ../../modules/i3.nix # i3 window manager configuration
    ../../modules/chromium.nix # google-free web browser
    ./hardware-configuration.nix # hardware configuration for the system
  ];

  boot = {
    # set the kernel packages to the latest available version
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      # enable systemd-boot as the bootloader
      systemd-boot.enable = true;

      # allow modification of EFI variables (required for UEFI systems)
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    # set the hostname for the system
    hostName = "ranni";

    # enable NetworkManager for network management
    networkmanager.enable = true;
  };

  # create nessecary directories
  systemd.tmpfiles.rules = [
    "d /home/shane/Developer - shane users - -"
    "d /home/shane/Developer/nix - shane users - -"
    "d /home/shane/Developer/rust - shane users - -"
    "d /home/shane/Developer/clone - shane users - -"
  ];

  # specify the state version for NixOS (used for compatibility with system updates)
  system.stateVersion = "24.11";
}
