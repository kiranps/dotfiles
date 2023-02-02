{ pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./homebrew.nix
    ./skhd.nix
    ./spacebar.nix
    ./yabai.nix
  ];

  home-manager.users.kiranps.imports = [ ./packages.nix ];
}
