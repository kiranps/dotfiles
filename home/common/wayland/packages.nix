{pkgs, ...}: {
  home.packages = with pkgs; [
    wf-recorder # Screen recorder for Wayland
    xdg-desktop-portal-wlr # XDG desktop portal for Wayland compositors
  ];
}
