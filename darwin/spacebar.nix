{ pkgs, ... }: {
  services.spacebar = {
    enable = false;
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
}
