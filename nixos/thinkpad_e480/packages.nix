{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pipewire
    pulseaudio
    bluez
    glibc_multi
    ddcutil
  ];
}
