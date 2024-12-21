{ lib, pkgs, ... }:

{
  users = {
    users = {
      shane = {
        isNormalUser = true;
        description = "User account for Shane";
        extraGroups = [ "networkmanager" "wheel" ];
      };
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-then 7d";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  console.keyMap = "uk";

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      (nerdfonts.override {
        fonts = [
          "Iosevka"
          "GeistMono"
          "FiraCode"
          "JetBrainsMono"
        ];
      })
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Color Emoji"
      ];

      sansSerif = [
        "Noto Sans"
        "Noto Color Emoji"
      ];

      monospace = [
        "GeistMono Nerd Font"
        "Noto Color Emoji"
      ];

      emoji = [
        "Noto Color Emoji"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    neofetch
    pciutils
    usbutils
    nixpkgs-fmt
    tree
    nextcloud-client
    nemo
  ];

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services = {
    printing = {
      enable = true;
    };

    libinput = {
      enable = true;
    };

    xserver = {
      enable = true;

      xkb = {
        layout = "gb";
        variant = "";
      };
    };

    power-profiles-daemon = {
      enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    xserver.displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
