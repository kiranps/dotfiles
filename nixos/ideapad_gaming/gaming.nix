{pkgs, ...}: {
  programs.steam = {
    enable = true;
  };
  hardware.graphics.enable = true;
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
  ];
}
