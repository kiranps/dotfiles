{pkgs, ...}: {
  programs.steam = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics.enable = true;
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
    lutris
  ];
}
