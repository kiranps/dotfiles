{ pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.kiranps = { home.stateVersion = "22.05"; };

  imports = [ ./database.nix ];

  home-manager.users.kiranps.imports = [
    ./alacritty.nix
    ./fzf.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./tmux.nix
    ./zsh.nix
    ./feh.nix
    #./gpg-agent.nix
  ];
}
