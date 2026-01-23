{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pipewire
    pulseaudio
    bluez
    glibc_multi
    ddcutil
    xdg-desktop-portal
    xdg-desktop-portal-wlr
  ];
}
