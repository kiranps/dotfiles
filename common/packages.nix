{ pkgs, ... }:

{
  programs.ssh = { enable = true; };
  programs.autojump.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.java.enable = true;
  programs.java.package = pkgs.jdk19;

  home.packages = with pkgs;
    [
      jq
      wget
      keybase
      kbfs
      tldr
      gnupg
      awscli2
      fx
      pinentry-curses
      nodejs
      ripgrep
      gh
      poetry
      inetutils
      mozjpeg
      geos
      ssm-session-manager-plugin
      nomad
      bat
      eza
      fd
      htop
      ffmpeg
      libheif
      imagemagick
      pgcli
      postgresql
      drone-cli
      #go_1_18
      diskonaut
      android-tools
      dive
      damon
      qpdf
      poppler_utils
      ansible_2_14
      jenkins
      qemu
      sshpass
      packer
      nodePackages.pm2
      mysql80
      toybox
      certbot
      redis
      opentelemetry-collector
      minikube
      maven
      rubyPackages_3_2.rails
    ] ++ [ (import ./python-packages.nix { pkgs = pkgs; }) ];
}
