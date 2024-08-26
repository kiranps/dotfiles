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
    tor-browser
    transmission_4
    inkscape-with-extensions
    gimp
  ];
}
