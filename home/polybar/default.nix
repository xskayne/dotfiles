{ pkgs, ... }:

{

  home = {
    # set the source for the polybar configuration file
    file."./.config/polybar/config.ini".source = ./config.ini;

    # define the source and target location for the themes
    file."./.config/polybar/themes" = {
      source = ./themes; # source of the themes directory
      recursive = true; # make sure to copy directories recursively
    };
  };

  services.polybar = {
    # enable polybar (status bar for X11)
    enable = true;

    # set script to launch polybar
    script = "";
  };
}
