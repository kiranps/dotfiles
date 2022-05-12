{ pkgs, ... }: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    package = pkgs.yabai;
    config = {
      # layout
      layout = "bsp";
      auto_balance = "off";
      split_ratio = "0.50";
      window_placement = "second_child";
      mouse_follows_focus = "off";
      focus_follows_mouse = "off";

      # Gaps
      window_gap = 4;
      top_padding = 28;
      bottom_padding = 0;
      left_padding = 0;
      right_padding = 0;

      # shadows and borders
      window_shadow = "on";
      window_border = "on";
      window_border_width = 6;
      window_opacity = "off";
      window_opacity_duration = "0.1";
      active_window_opacity = "1.0";
      normal_window_opacity = "1.0";

      # mouse
      mouse_modifier = "cmd";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
    };

    extraConfig = ''
      # rules
      yabai -m space 1 --label term
      yabai -m space 2 --label browser
      yabai -m space 3 --label chat

      yabai -m rule --add app='System Preferences' manage=off
      yabai -m rule --add app='Activity Monitor' manage=off

      yabai -m rule --add app='alacritty' space=1
      yabai -m rule --add app='Google Chrome' space=2
    '';
  };

  services.spacebar = {
    enable = true;
    package = pkgs.spacebar;
    config = {
      position = "top";
      height = 28;
      title = "on";
      spaces = "on";
      power = "on";
      clock = "off";
      right_shell = "off";
      padding_left = 20;
      padding_right = 20;
      spacing_left = 25;
      spacing_right = 25;
      text_font = ''"Menlo:16.0"'';
      icon_font = ''"Menlo:16.0"'';
      background_color = "0xff161616";
      foreground_color = "0xffFFFFFF";
      space_icon_color = "0xff3ddbd9";
      power_icon_strip = " ";
      space_icon_strip = "一 二 三 四 五 六 七 八 九 十";
      spaces_for_all_displays = "on";
      display_separator = "on";
      display_separator_icon = "|";
      clock_format = ''"%d/%m/%y %R"'';
      right_shell_icon = " ";
      right_shell_command = "whoami";
    };
  };

  services.skhd = {
    enable = true;
    package = pkgs.skhd;

    skhdConfig = ''
      # open terminal
      cmd - return : alacritty

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
      shift + alt - 8 : yabai -m window --space 8

      # float / unfloat window and center on screen
      # cmd - t : yabai -m window --toggle float;\
      #	       yabai -m window --grid 4:4:1:1:2:2

      # toggle window zoom
      lalt - d : yabai -m window --toggle zoom-fullscreen
      lalt - f : yabai -m window --toggle native-fullscreen
    '';
  };
}
