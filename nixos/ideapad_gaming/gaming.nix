{pkgs, ...}: {
  programs = {
    #gamescope = {
    #enable = true;
    #capSysNice = true;
    #};
    #steam = {
    #enable = true;
    #gamescopeSession.enable = true;
    #};
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      intel-media-driver
      libva-vdpau-driver
      libvdpau-va-gl
      intel-gpu-tools
    ];
  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia" "intel"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false; # use proprietary driver
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  #services.ollama = {
  #enable = true;
  #package = pkgs.ollama-cuda; #https://cache.nixos-cuda.org/
  #models = "/d/ollama/models";
  #};

  environment.systemPackages = with pkgs; [
    #wineWow64Packages.full
    #protonup-qt
    #winetricks
    vulkan-tools
    #dxvk
    #lutris
    umu-launcher
  ];
}
