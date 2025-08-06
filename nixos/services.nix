{ config, pkgs, lib, ... }: {
  #services.kdeconnect.enable = true; #home
  #systemd.services.docker.enable = lib.mkForce false;
  systemd.services.samba-nmbd.enable = false;
  systemd.services.printing.enable = false;
  systemd.services.sambawinbindd = { enable = false; };
  #systemd.services.systemd-user-sessions = {
    #before = [ "resolvconf.service" ];
  #};
}
