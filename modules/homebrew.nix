{ config, lib, pkgs, ... }: {
  homebrew.onActivation.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.upgrade = true;
  homebrew.onActivation.cleanup = true;
  homebrew.global.brewfile = true;
  homebrew.global.lockfiles = true;

  homebrew.taps = [ "homebrew/core" "homebrew/cask" "homebrew/cask-drivers" ];
  homebrew.casks = [
    "google-chrome"
    "slack"
    "firefox"
    "transmission"
    "tor-browser"
    "vlc"
    "docker"
    "android-file-transfer"
    "keybase"
    "gimp"
  ];
  homebrew.brews =
    [ "starship" "openssl" "opam" "terraform" "libpq" "goaccess" "zenith" "geos" ];
}
