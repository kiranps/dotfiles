{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture # Wayland/X11 game capture
      obs-gstreamer # extra encoding/decoding
      wlrobs
    ];
  };
}
