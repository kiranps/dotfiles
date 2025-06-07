{ pkgs, ... }: {
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.inconsolata
    nerd-fonts.iosevka
    nerd-fonts.victor-mono
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
  ];
}
