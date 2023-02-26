{ pkgs, ... }:

{
  programs.ssh = { enable = true; };
  programs.autojump.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs;
    [
      jq
      wget
      keybase
      kbfs
      tldr
      openvpn
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
      exa
      fd
      htop
      ffmpeg
      libheif
      imagemagick
      pgcli
      postgresql
      drone-cli
      go_1_18
      vscode
      diskonaut
      android-tools
    ] ++ [ (import ./python-packages.nix { pkgs = pkgs; }) ];
}
