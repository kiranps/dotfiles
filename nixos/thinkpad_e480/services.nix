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
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.tailscale.enable = false;
  #services.dbus.enable = true;
  #systemd.services.systemd-user-sessions = {
  #before = [ "resolvconf.service" ];
  #};
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "kiran";
    group = "users";

    hardwareAcceleration = {
      enable = true;
      device = "/dev/dri/renderD128";
      type = "vaapi";
    };
  };

  systemd.services.jellyfin.environment.LIBVA_DRIVER_NAME = "iHD";

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        LLMNR = false;
        MulticastDNS = true;
      };
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  services.samba = {
    enable = true;
    openFirewall = true;

    settings = {
      global = {
        security = "user";
        "map to guest" = "bad user";
      };
      guest_share = {
        path = "/home/kiran/Downloads/Movies/";
        browseable = true;
        "public" = true;
        "guest ok" = true;
        "printable" = false;
        "force user" = "kiran";
        "force group" = "users";
      };
    };
  };
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';
}
