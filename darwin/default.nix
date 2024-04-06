{ pkgs, ... }:

{
  imports = [
    ./configuration.nix
    ./homebrew.nix
    #../modules/sketchybar
    ./yabai.nix
    ./skhd.nix
    ./sketchybar
  ];

  home-manager.users.kiranps.imports = [ ./packages.nix ];
}
