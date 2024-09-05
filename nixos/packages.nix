{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    starship
    xclip
    xsel
    godot_4
    arandr
    blender
    sxiv
    libreoffice
    tor-browser
    transmission_4
    inkscape-with-extensions
    gimp
    flameshot
    localsend
  ];
}
