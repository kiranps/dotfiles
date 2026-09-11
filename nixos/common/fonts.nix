{pkgs, ...}: {
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.inconsolata
    nerd-fonts.victor-mono
    nerd-fonts.droid-sans-mono
  ];
}
