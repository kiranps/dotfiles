{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./services.nix
    ./hardware_configuration.nix
    ./fonts.nix
  ];
}
