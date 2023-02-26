{ config, lib, pkgs, ... }:

let scripts = ./scripts;
in {
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    config = ''
    #!/bin/bash


    bar_color=0xff2e3440
    icon_font="VictorMono Nerd Font:Bold:12.0"
    label_font="VictorMono Nerd Font:Regular:12.0"
    icon_color=0xbbd8dee9
    icon_highlight_color=0xffebcb8b
    label_color="$icon_color"
    label_highlight_color="$icon_highlight_color"

    sketchybar --default updates=when_shown \
                         icon.font=$icon_font \
                         label.font=$label_font \
                         icon.color=0xffffffff \
                         label.color=0xffffffff \
                         background.color=0xff161616 \
                         background.padding_left=4 \
                         background.padding_right=4 \
                         background.height=40

    sketchybar --add   space          space_template left                \
               --set   space_template icon.highlight_color=0xff9dd274    \
                                      label.drawing=off                  \
                                      drawing=off                        \
                                      updates=on                         \
                                      associated_display=1               \
                                      icon.font="$icon_font" \
                                      label.font="$label_font" \
                                      script="${scripts}/space.sh"      \
                                      icon.padding_right=6               \
                                      icon.padding_left=2                \
                                      background.padding_left=2          \
                                      background.padding_right=2         \
                                      icon.background.height=2           \
                                      icon.background.color=$icon_color  \
                                      icon.background.color=$icon_color  \
                                      icon.background.y_offset=-13       \
                                      click_script="yabai -m space --focus \$SID 2>/dev/null" \
                                                                         \
               --clone spaces_1.code  space_template                     \
               --set   spaces_1.code  associated_space=1                 \
                                      icon=1                             \
                                      icon.highlight_color=0xff9dd274    \
                                      icon.background.color=0xff9dd274   \
                                      drawing=on                         \
                                                                         \
               --clone spaces_1.web   space_template                     \
               --set   spaces_1.web   associated_space=2                 \
                                      icon=2                             \
                                      icon.highlight_color=0xfff69c5e    \
                                      icon.background.color=0xfff69c5e   \
                                      drawing=on                         \
                                                                         \
               --clone spaces_1.chat  space_template                     \
               --set   spaces_1.chat  associated_space=3                 \
                                      icon=3                             \
                                      icon.highlight_color=0xff72cce8    \
                                      icon.background.color=0xff72cce8   \
                                      drawing=on                         \

    sketchybar -m \
      --bar \
        height=24 \
        position=top \
        sticky=on \
        shadow=off \
        padding_left=10 \
        padding_right=10 \
        color=0xff161616 \
      --default \
        icon.font="$icon_font" \
        icon.color="$icon_color" \
        icon.highlight_color="$icon_highlight_color" \
        label.font="$label_font" \
        label.color="$label_color" \
        label.highlight_color="$label_highlight_color" \
        icon.padding_left=10 \
        icon.padding_right=6 \
      --add item window_title center \
      --set window_title script='sketchybar --set "$NAME" label="$INFO"' \
      --subscribe window_title front_app_switched \
      --add item clock right \
      --set clock update_freq=10 script="${scripts}/status.sh" icon.padding_left=2 \
      --add item battery right \
      --set battery update_freq=60 script="${scripts}/battery.sh" \
      --add item input right \
      --default \
        icon.padding_left=0 \
        icon.padding_right=2 \
        label.padding_right=16 

      sketchybar --update

    '';
  };
  services.yabai.config.external_bar = "main:24:0";
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
}
