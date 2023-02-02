{ pkgs, ... }:

{
  users.users.kiranps = {
    name = "kiranps";
    home = "/Users/kiranps";
  };

  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;
      minimize-to-application = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
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

  imports = [ ./system.nix ];

  programs.zsh.enable = true;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  home-manage.home.stateVersion = "22.05";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.kiranps.import =
    [ ./neovim.nix ./programs.nix ];
}
