{
  lib,
  pkgs,
  ...
}:
with lib;
with pkgs; let
  mod4 = "Mod4";
in {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "${mod4}";
      terminal = "alacritty";
      keybindings = mkOptionDefault {
        "${mod4}+space" = "exec ${rofi}/bin/rofi -show drun";
        "${mod4}+f" = "exec firefox";
      };
      bars = [];
      window = {
        hideEdgeBorders = "smart";
      };
      workspaceOutputAssign =
        (map (n: {
          output = "HDMI-A-1";
          workspace = toString n;
        }) (lib.range 1 5))
        ++ (map (n: {
          output = "eDP-1";
          workspace = toString n;
        }) (lib.range 6 9));
    };
  };
}
