{...}: {
  services.gnome-keyring.enable = true;
  services = {
    mako = {
      enable = true;
    };
  };
}
