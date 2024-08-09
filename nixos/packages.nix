{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    starship
    xclip
    xsel
    godot_4
    arandr
    zeroad
    blender
    sxiv
    libreoffice
  ];
}
