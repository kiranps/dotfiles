{ pkgs, ... }:

{
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  home.packages = with pkgs; [
    firefox
    starship
    xclip
    xsel
    #godot_4
    arandr
    #blender
    sxiv
    libreoffice
    tor-browser
    transmission_4-gtk
    #inkscape-with-extensions
    gimp
    flameshot
    localsend
    #android-studio
    #genymotion
    #xorg.libxkbfile
    #aseprite
    #spacedrive
    #playonlinux
    python3Packages.pygobject3
    dxvk
    eog
    nomacs
    zoom-us
    usbutils
    libnotify
  ];
}
