{
  config,
  pkgs,
  lib,
  ...
}: {
  systemd.services.samba-nmbd.enable = false;
  systemd.services.printing.enable = false;
  systemd.services.sambawinbindd = {enable = false;};
  #services.dbus.enable = true;
  programs.kdeconnect.enable = true;
  systemd.services.kdeconnect.enable = true;
  #systemd.services.systemd-user-sessions = {
  #before = [ "resolvconf.service" ];
  #};
}
