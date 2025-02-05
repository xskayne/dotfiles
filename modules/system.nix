{
  lib,
  pkgs,
  username,
  ...
}:

{
  users = {
    # determines whether user management can be modified after installation
    mutableUsers = false;

    # define the user account for the given username
    users.${username} = {

      # make the user a normal (non-administrative) user
      isNormalUser = true;

      # set the description for the user (typically the username)
      description = username;

      # specify additional groups the user belongs to, such as network management and administrative privileges
      extraGroups = [
        "networkmanager" # user can manage network connections
        "wheel" # user can use sudo (administrative permissions)
        "audio" # user can access audio devices
        "video" # user can access video devices
      ];

      # set the hashed password for the user
      hashedPassword = "$6$YcBDZH8TcBJZV3hF$R8K16FSCrRfPVB3QqolKlbRfv09ATRwfCn1GVq3YTMcEERgcA6.2bCITLoEgvIJhHY4g1/gdnCfwxj/7urKtu1";
    };
  };

  nix = {
    settings = {
      # enable experimental features: nix-command (for advanced command-line features) and flakes (for modular nix configurations)
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # enable automatic store optimization (cleans up unnecessary data from the nix store)
      auto-optimise-store = true;
    };

    # garbage collection settings: manage unused packages and configurations
    gc = {
      # automatically run garbage collection
      automatic = lib.mkDefault true;

      # set the frequency of garbage collection (weekly in this case)
      dates = lib.mkDefault "weekly";

      # set options for deleting packages older than 7 days
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  # allow unfree packages (software that doesn't comply with open-source licenses)
  nixpkgs.config = {
    allowUnfree = true;
  };

  # set the system's time zone to Europe/London
  time.timeZone = "Europe/London";

  i18n = {
    # set the default locale for the system
    defaultLocale = "en_GB.UTF-8";

    # define additional locale settings (specific regional and cultural settings for things like time formats)
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8"; # address format
      LC_IDENTIFICATION = "en_GB.UTF-8"; # identification format
      LC_MEASUREMENT = "en_GB.UTF-8"; # measurement units
      LC_MONETARY = "en_GB.UTF-8"; # monetary formatting
      LC_NAME = "en_GB.UTF-8"; # name formatting
      LC_NUMERIC = "en_GB.UTF-8"; # numeric format
      LC_PAPER = "en_GB.UTF-8"; # paper size formatting
      LC_TELEPHONE = "en_GB.UTF-8"; # telephone number formatting
      LC_TIME = "en_GB.UTF-8"; # date and time formatting
    };
  };

  console = {
    # setup console early (for early startup tasks)
    earlySetup = true;

    # use a specific font for the console
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";

    # define console packages (e.g., font packages)
    packages = with pkgs; [
      terminus_font
    ];

    # set the keyboard layout to uk
    keyMap = "uk";
  };

  fonts = {
    # define a list of fonts to be available on the system
    packages = with pkgs; [
      material-design-icons # material design icons
      noto-fonts # noto fonts (covers multiple languages)
      noto-fonts-cjk-sans # cjk (chinese, japanese, korean) support
      noto-fonts-emoji # emoji support
      nerd-fonts.iosevka # iosevka nerd font
      nerd-fonts.jetbrains-mono # jetbrains mono nerd font (for developers)
    ];

    # disable the default font packages
    enableDefaultPackages = false;

    # configure default system fonts for different categories
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
        "JetBrainsMono Nerd Font"
        "Noto Color Emoji"
      ];

      emoji = [
        "Noto Color Emoji"
      ];
    };
  };

  # define essential system packages that will be installed by default
  environment.systemPackages = with pkgs; [
    vim # text editor
    wget # command-line downloader
    curl # command-line tool for transferring data
    git # version control system
    pciutils # utility for listing pci devices
    usbutils # utility for listing usb devices
    tree # command-line tree viewer
    scrot # screenshot tool
    neofetch # system info display tool
    zip # zip file compressor
    unrar # rar file extractor
    unzip # zip file extractor
    gnupg # gpg for encryption and signing
    xorg.xev # x11 event viewer
    alsa-utils # alsa sound utilities
  ];

  hardware = {
    graphics = {
      # enable graphics support
      enable = true;

      # enable 32-bit graphics (if necessary for older hardware or specific software)
      enable32Bit = true;
    };

    alsa = {
      # enable alsa (advanced linux sound architecture) for sound
      enable = true;
    };
  };

  # enable real-time priority scheduling (useful for audio, video, and other high-priority tasks)
  security.rtkit.enable = true;

  services = {
    openssh = {
      # enable openssh server for remote access
      enable = true;

      settings = {
        # allow x11 forwarding over ssh (for running graphical apps remotely)
        X11Forwarding = true;

        # disable root login via ssh (for security)
        PermitRootLogin = "no";

        # disable password authentication, relying on ssh keys instead
        PasswordAuthentication = false;
      };

      # open the firewall for ssh access
      openFirewall = true;
    };

    # disable pulseaudio sound server
    pulseaudio.enable = false;

    # enable printing services
    printing.enable = true;

    libinput = {
      # enable libinput for touchpad and input device configuration
      enable = true;

      touchpad = {
        # enable natural scrolling for touchpads
        naturalScrolling = true;
      };
    };

    # enable power profiles daemon for power management
    power-profiles-daemon.enable = true;

    pipewire = {
      # disable pipewire (alternative to pulseaudio for managing audio)
      enable = false;

      alsa.enable = true; # enable alsa support with pipewire
      alsa.support32Bit = true; # enable 32-bit alsa support with pipewire
      pulse.enable = true; # enable pulseaudio support with pipewire
      jack.enable = true; # enable jack (professional audio) support with pipewire
    };
  };
}
