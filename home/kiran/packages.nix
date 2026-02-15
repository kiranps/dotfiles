{pkgs, ...}: {
  home.packages = with pkgs; [
    libheif
  ];
}
