{ pkgs, ... }:

{
  programs.alacritty = {
    # enable the alacritty terminal
    enable = true;

    settings = {
      terminal = {
        # set the default shell to zsh
        shell = "${pkgs.zsh}/bin/zsh";
      };

      window = {
        # set the window title
        title = "Terminal";

        padding = {
          # set padding for the terminal window
          y = 16; # vertical padding
          x = 16; # horizontal padding
        };

        dimensions = {
          # set the initial terminal dimensions (lines and columns)
          lines = 64; # number of lines in the terminal
          columns = 16; # number of columns in the terminal
        };
      };

      cursor = {
        # set cursor style and behavior
        style = {
          shape = "Beam"; # beam cursor shape
          blinking = "Never"; # disable blinking cursor
        };

        # configure cursor when the window is unfocused
        unfocused_hollow = false;

        # set the cursor thickness
        thickness = 0.15;
      };

      font = {
        # set normal font for the terminal
        normal = {
          family = "JetBrainsMono Nerd Font"; # font family
          style = "Medium"; # font style
        };

        # set bold font for the terminal
        bold = {
          family = "JetBrainsMono Nerd Font"; # font family
          style = "Bold"; # font style
        };

        # set font size
        size = 12;
      };

      env = {
        # set terminal environment variables
        TERM = "xterm-256color"; # terminal type
        COLORTERM = "truecolor"; # enable truecolor support
      };
    };
  };
}
