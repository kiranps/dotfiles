{ pkgs, ... }: {
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs;
    [
      (nerdfonts.override { fonts = [ "Inconsolata" "Iosevka" "VictorMono" ]; })
    ];
}
