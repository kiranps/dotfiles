{ pkgs, ... }: {
  programs.feh = {
    enable = true;
    keybindings = {
      next_img = [ "h" "Left" ];
      prev_img = [ "l" "Right" ];
      zoom_in = [ "j" "Up" ];
      zoom_out = [ "k" "Down" ];
      scroll_up = [ "J" "C-Up" ];
      scroll_down = [ "K" "C-Down" ];
      scroll_left = [ "H" "C-Left" ];
      scroll_right = [ "L" "C-Right" ];
      zoom_default = "d";
      zoom_fit = "s";
    };
  };
}
