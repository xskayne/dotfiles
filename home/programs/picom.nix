{ pkgs, ... }:

{
  services.picom = {
    # enable picom (a compositor for X11)
    enable = true;

    # set backend to glx (OpenGL for compositing)
    backend = "glx";

    # enable vertical sync to reduce screen tearing
    vSync = true;

    activeOpacity = 1.0;

    inactiveOpacity = 0.8;

    menuOpacity = 0.8;

    settings = {
      fading = true;
      fade-in-step = 0.03;
      fade-out-step = 0.03;
      blur-method = "dual_kawase";
      blur-strength = 2;
      alpha-step = 0.06;
      detect-client-opacity = true;
      detect-rounded-corners = true;
      paint-on-overlay = true;
      detect-transient = true;
      corner-radius = 10.0;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];
    };
  };
}
