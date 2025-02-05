{
  # import configuration for programs
  imports = [
    ./browsers.nix # browsers configuration
    ./git.nix # git configuration
    ./common.nix # common settings configuration
    ./media.nix # media configuration
    ./picom.nix # picom configuration (compositor for X11)
  ];
}
