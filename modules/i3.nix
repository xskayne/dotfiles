{ pkgs, ... }:

{
  services = {
    # configure the display manager session (set to none+i3 for a custom i3 session)
    displayManager = {
      defaultSession = "none+i3";
    };

    xserver = {
      # enable the X server
      enable = true;

      desktopManager = {
        # enable xterm terminal emulator for X server
        xterm.enable = true;
      };

      displayManager = {
        # disable LightDM display manager (for login screen)
        lightdm.enable = false;

        # enable GDM (GNOME Display Manager) for login screen
        gdm.enable = true;
      };

      windowManager.i3 = {
        # enable the i3 window manager
        enable = true;

        # define extra packages to install for i3 window manager
        extraPackages = with pkgs; [
          rofi # rofi (application launcher)
          i3lock # i3lock (screen locker)
          xautolock # xautolock (automatic screen locking)
          i3-gaps # i3-gaps (i3 with gaps between windows)
          picom # picom (compositor for transparency, shadows, etc.)
          feh # feh (lightweight image viewer, used for setting wallpaper)
          autotiling # autotiling (script for sway and i3 to automatically switch the horizontal / vertical window split orientation)
          brightnessctl # application to control backlight
        ];
      };

      # set the keyboard layout to GB (Great Britain)
      xkb = {
        layout = "gb";

        # no specific variant for the keyboard layout
        variant = "";
      };
    };
  };
}
