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
      window_border_width = 6;
      window_opacity = "off";
      window_opacity_duration = "0.1";
      active_window_opacity = "1.0";
      normal_window_opacity = "1.0";

      window_border = "on";
      window_border_radius = 0;
      window_border_hidpi = "on";
      window_border_blur = "on";

      # Color
      active_window_border_color = "0xff363636";
      normal_window_border_color = "0xff303030";

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

      yabai -m rule --add app='alacritty' manage=on space=1
      yabai -m rule --add app='Google Chrome' manage=on space=2
      yabai -m rule --add app='Slack' manage=on space=3
    '';
  };

}
