{ config, pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./services.nix
    ./hardware_configuration.nix
    ./boot_optimisation.nix
    ./fonts.nix
  ];
}
