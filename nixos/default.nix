{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./systemd.nix
    ./hardware-configuration.nix
    ./home.nix
    ./fonts.nix
  ];
}
