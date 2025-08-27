{...}: {
  services.gnome-keyring.enable = true;
  services.cliphist.enable = true;
  services = {
    mako = {
      enable = true;
    };
  };
}
