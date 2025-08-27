{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    bluez
    glibc_multi
    podman
    podman-compose
    ddcutil
  ];
}
