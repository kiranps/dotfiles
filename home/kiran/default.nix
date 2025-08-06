{
  config,
  pkgs,
  ...
}: {
  home.username = "kiran";
  home.homeDirectory = "/home/kiran";
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
  imports = [
    ../common/alacritty.nix
    ../common/zsh.nix
    ../common/fzf.nix
    ../common/git.nix
    ../common/neovim.nix
    ../common/packages.nix
    ../common/tmux.nix
    ../common/feh.nix
    ../common/gpg-agent.nix
    ./packages.nix
    ./starship.nix
    ./awesome
    ./rofi.nix
    ./grobi.nix
  ];
}
