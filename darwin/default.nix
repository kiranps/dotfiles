{ pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./homebrew.nix
    ./yabai.nix
    ./skhd.nix
    ./sketchybar
  ];

  home-manager.users.kiranps.imports = [ ./packages.nix ];
}
