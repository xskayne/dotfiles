{
  # import configuration files for alacritty, common settings, and starship
  imports = [
    ./alacritty.nix # alacritty terminal configuration
    ./common.nix # common settings configuration
    ./starship.nix # starship prompt configuration
  ];

  home.sessionVariables = {
    # set the default editor to vim
    EDITOR = "vim";

    # set the default web browser to firefox
    BROWSER = "firefox";

    # set the default terminal emulator to alacritty
    TERMINAL = "alacritty";
  };
}
