{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ddcutil
    pulseaudio
    pipewire
    grim
    slurp
    xdg-desktop-portal
    xdg-desktop-portal-wlr
  ];
}
