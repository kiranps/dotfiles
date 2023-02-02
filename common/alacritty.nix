{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 4;
          y = 0;
        };
        decorations = "buttonless";
      };
      scrolling.history = 100000;
      live_config_reload = true;
      selection.save_to_clipboard = true;
      mouse.hide_when_typing = true;
      use_thin_strokes = true;

      font = {
        size = 16;
        normal.family = "VictorMono Nerd Font";
        bold.family = "VictorMono Nerd Font";
        italic.family = "VictorMono Nerd Font";
      };

      colors = {
        cursor.cursor = "#81a1c1";

        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };

        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };
    };
  };

}
