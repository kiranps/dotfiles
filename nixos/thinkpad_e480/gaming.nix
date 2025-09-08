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
      vaapiIntel
      intel-vaapi-driver
      intel-media-driver
      vaapiVdpau
      libvdpau-va-gl
      intel-gpu-tools
    ];
  };

  hardware.xone.enable = true;

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
    lutris
    mangohud
  ];
}
