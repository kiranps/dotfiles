{ pkgs, ... }:

let
  #myOverlays = [ (import ../nixos/overlays/ollama.nix) ];

  #pkgsWithOverlay = import pkgs.path {
    #inherit (pkgs) system;
    #overlays = myOverlays;
  #};

in {
  programs.ssh = { enable = true; };
  programs.autojump.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  #programs.java.enable = true;
  #programs.java.package = pkgs.jdk19;

  home.packages = with pkgs;
    [
      jq
      wget
      tldr
      awscli2
      fx
      pinentry
      nodejs
      ripgrep
      gh
      poetry
      inetutils
      bat
      fd
      htop
      ffmpeg
      libheif
      imagemagick
      pgcli
      litecli
      #diskonaut
      dive
      damon
      sshpass
      #toybox
      unzip
      eza
      ranger
      nnn
      grobi
      #steam-run
      scons
      pkg-config
      gcc
      cmake
      udev
      xorg.libX11
      fontconfig
      #wineWowPackages.unstableFull
      psmisc
      vlc
      #filezilla
      python312Packages.twisted
      python312Packages.pdfminer-six
      jstest-gtk
      ntfs3g
      exfatprogs
      lsof
      llama-cpp
      docker-compose
      qpdf
      ripmime
      #xfce.thunar-archive-plugin
      postman
      chromium
      micromamba
      uv
      gdu
      mupdf
      terraform
      warp-terminal
    ] ++ [ (import ./python-packages.nix { pkgs = pkgs; }) ];
    #++ [ pkgsWithOverlay.ollama ];
}
