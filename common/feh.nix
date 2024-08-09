{ pkgs, ... }: { 
  programs.feh = {
    enable = true;
    keybindings = {
        prev_img = [ "h" "Left" ];
    }
  }
}
