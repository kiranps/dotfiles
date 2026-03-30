{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./services.nix
    ./hardware_configuration.nix
    ../common/fonts.nix
    ./packages.nix
    ./gaming.nix
  ];
}
