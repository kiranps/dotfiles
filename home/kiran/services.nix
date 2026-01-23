{pkgs, ...}: {
  services.gnome-keyring.enable = true;
  services = {
    kdeconnect = {
      enable = true;
    };
  };
}
