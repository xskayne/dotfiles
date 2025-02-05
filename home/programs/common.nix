{ pkgs, ... }:

{
  programs = {
    # enable tmux (terminal multiplexer)
    tmux = {
      # enable tmux
      enable = true;

      # enable 24-hour clock format in tmux
      clock24 = true;
    };
  };
}
