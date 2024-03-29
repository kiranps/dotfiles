{ pkgs, ... }: {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;

    skhdConfig = ''
      # open terminal
      cmd - return : /etc/profiles/per-user/kiranps/bin/alacritty

      # focus window
      cmd - j : yabai -m window --focus west
      cmd - k : yabai -m window --focus east

      # focus on next/prev space
      cmd - h : yabai -m space --focus prev
      cmd - l : yabai -m space --focus next

      # swap managed window
      shift + cmd - h : yabai -m window --swap west
      shift + cmd - l : yabai -m window --swap east
      shift + cmd - j : yabai -m window --swap south
      shift + cmd - k : yabai -m window --swap north

      # focus spaces
      alt - x : yabai -m space --focus recent
      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8


      # send window to desktop
      shift + alt - x : yabai -m window --space recent
      shift + alt - 1 : yabai -m window --space 1
      shift + alt - 2 : yabai -m window --space 2
      shift + alt - 3 : yabai -m window --space 3
      shift + alt - 4 : yabai -m window --space 4
      shift + alt - 5 : yabai -m window --space 5
      shift + alt - 6 : yabai -m window --space 6
      shift + alt - 7 : yabai -m window --space 7
      shift + alt - 8 : yabai -m window --space 

      # float / unfloat window and center on screen
      # cmd - t : yabai -m window --toggle float;\
      #	       yabai -m window --grid 4:4:1:1:2:2

      # toggle window zoom
      lalt - d : yabai -m window --toggle zoom-fullscreen
      lalt - f : yabai -m window --toggle native-fullscreen
    '';
  };
}
