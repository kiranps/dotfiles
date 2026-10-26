{pkgs, ...}: {
  #services = {
  #kdeconnect = {
  #enable = true;
  #};
  #};

  services.netdata = {
    enable = true;
  };
}
