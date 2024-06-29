{ config, pkgs, ... }:

{
  users.users.kiranps = {
    name = "kiranps";
    home = "/Users/kiranps";
  };

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;


  nix.package = pkgs.nixFlakes;
  nix.settings.trusted-users = [ "root" "kiranps" ];

  services.activate-system.enable = true;

  nix.extraOptions = ''
    system = aarch64-darwin
    experimental-features = nix-command flakes
    keep-derivations = true
    keep-outputs = true
  '';

  services.nix-daemon.enable = true;

  networking.hostName = "skynet";

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs;
      [
        (nerdfonts.override {
          fonts = [ "Inconsolata" "Iosevka" "VictorMono" ];
        })
      ];
  };

  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;
      minimize-to-application = true;
    };
  };

  system.keyboard = { enableKeyMapping = true; };

  system.stateVersion = 4;
}
