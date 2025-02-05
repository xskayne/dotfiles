{ pkgs, ... }:

{
  home.file."./.config/polybar/config.ini".source = ./config.ini;

  services.polybar = {
    # enable polybar (status bar for X11)
    enable = true;

    # set script to launch polybar
    script = "";
  };
}
