{pkgs, ...}: {
  programs.steam = {
    enable = true;
  };
  hardware.graphics.enable = true;
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia" "intel"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false; # use proprietary driver
    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
  ];
}
