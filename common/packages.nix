{ pkgs, ... }:

{
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
      diskonaut
      android-tools
      dive
      damon
      sshpass
      toybox
      unzip
      eza
      ranger
      nnn
      grobi
    ] ++ [ (import ./python-packages.nix { pkgs = pkgs; }) ];
}
