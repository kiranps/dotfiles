{pkgs, ...}: {
  home.packages = with pkgs; [
    wf-recorder # Screen recorder for Wayland
    wl-screenrec
    wlr-randr # RandR implementation for wlroots-based compositors
    xdg-desktop-portal-wlr # XDG desktop portal for Wayland compositors
  ];
}
