{
  config,
  pkgs,
  lib,
  ...
}: {
  systemd.services.samba-nmbd.enable = false;
  systemd.services.printing.enable = false;
  systemd.services.sambawinbindd = {enable = false;};
  services.openssh.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;
  #services.dbus.enable = true;
  #systemd.services.systemd-user-sessions = {
  #before = [ "resolvconf.service" ];
  #};
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';
}
