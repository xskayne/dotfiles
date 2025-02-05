{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ani-cli # anime downloader/streamer
    spicetify-cli # spotify client customizer
  ];

  programs = {
    mpv = {
      # enable mpv (media player)
      enable = true;
    };

    obs-studio = {
      # enable obs-studio (open-source software for video recording and live streaming)
      enable = true;
    };
  };
}
