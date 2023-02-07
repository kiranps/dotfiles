{ pkgs, ... }:

{
  imports = [
    ../modules/sketchybar
    ./configuration.nix
    ./yabai.nix
    ./skhd.nix
    ./homebrew.nix
    ./sketchybar
  ];

  home-manager.users.kiranps.imports = [ ./packages.nix ];
}
