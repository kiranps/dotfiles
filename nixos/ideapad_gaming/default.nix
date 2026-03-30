{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./services.nix
    ../common/fonts.nix
    ./packages.nix
    ./gaming.nix
    ./security.nix
    ./hardware_configuration.nix
  ];
}
