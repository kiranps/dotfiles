{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ddcutil
    pulseaudio
    pipewire
    xdg-desktop-portal
    xdg-desktop-portal-wlr
  ];
}
