{ config, lib, pkgs, ... }:

let
  inherit (lib) mkIf;
  caskPresent = cask: lib.any (x: x.name == cask) config.homebrew.casks;
  brewEnabled = config.homebrew.enable;

in {
  environment.shellInit = mkIf brewEnabled ''
    eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
  '';

  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.global.brewfile = true;

  homebrew.taps = [
    #"homebrew/cask"
    "homebrew/cask-drivers"
    "homebrew/cask-fonts"
    "homebrew/cask-versions"
    #"homebrew/core"
    "homebrew/services"
    "nrlquaker/createzap"
  ];

  homebrew.casks = [
    "google-chrome"
    "firefox"
    "transmission"
    "tor-browser"
    "vlc"
    "docker"
    "android-file-transfer"
    "keybase"
    "slack"
  ];

  homebrew.brews =
    [ "openssl" "opam" "terraform" "goaccess" "zenith" "starship" ];
}
