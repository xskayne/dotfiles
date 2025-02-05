{ pkgs, ... }:

{
  # import the core and specific configuration files for home setup
  imports = [
    ../../home/core.nix # core home configuration
    ../../home/i3 # i3 window manager configuration
    ../../home/programs # general programs configuration
    ../../home/shell # shell configuration
    ../../home/polybar # polybar configuration
    ../../home/rofi # rofi (application launcher) configuration
  ];

  # enable catppuccin theme for home-manager
  catppuccin.enable = true;

  # set the flavor of the catppuccin theme (mocha in this case)
  catppuccin.flavor = "latte";

  home = {
    # define packages to be installed for the user
    packages = with pkgs; [
      nixfmt-rfc-style # nixfmt tool for formatting nix files according to RFC style
      gcc # GNU Compiler Collection
      rustup # Rust toolchain installer
      signal-desktop # Signal desktop application (end-to-end encrypted messaging)
      vesktop # Discord client
      vlc # VLC media player
      runelite # RuneScape client (old-school)
      vscode # Visual Studio Code (code editor)
      kmymoney # KMyMoney (personal finance manager)
      nextcloud-client # Nextcloud client for syncing files and data
    ];
  };

  programs.git = {
    # configure Git user details
    userName = "Shane Wilson"; # Git username
    userEmail = "shane.wilson@myyahoo.com"; # Git user email
  };
}
