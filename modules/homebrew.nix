{ config, lib, pkgs, ... }: {
  homebrew.enable = true;
  homebrew.autoUpdate = true;
  homebrew.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.global.noLock = true;

  homebrew.taps = [ "homebrew/core" "homebrew/cask" "homebrew/cask-drivers" ];
  homebrew.casks = [ "google-chrome" "slack" "firefox" "transmission" "tor-browser" "vlc" "docker" "android-file-transfer"];
  homebrew.brews = [ "starship" "openssl" "postgres" ];
}
