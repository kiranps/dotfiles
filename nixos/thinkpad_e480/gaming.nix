{pkgs, ...}: {
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  services.xserver.videoDrivers = ["intel"];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      intel-media-driver
      libvdpau-va-gl
      intel-gpu-tools
    ];
  };

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
    lutris
    mangohud
  ];
}
