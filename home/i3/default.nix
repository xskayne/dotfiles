{
  pkgs,
  lib,
  ...
}:

{
  home = {
    # set the source for the i3 configuration file
    file."./.config/i3/config".source = ./config;

    # define the source and target location for the wallpapers
    file."./.config/i3/wallpaper" = {
      source = ../../wallpaper; # source of the wallpaper directory
      recursive = true; # make sure to copy directories recursively
    };
  };

  # set xresources properties for font and cursor size
  xresources.properties = {
    "Xft.dpi" = 110; # set font DPI to 110
    "Xcursor.size" = 16; # set cursor size to 16
  };

  xsession.windowManager.i3 = {
    # enable i3 window manager
    enable = true;

    # use i3-gaps package for i3 with gaps between windows
    package = pkgs.i3-gaps;
  };
}
