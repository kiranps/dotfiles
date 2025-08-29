{
  config,
  pkgs,
  ...
}: {
  home.username = "makhang";
  home.homeDirectory = "/home/makhang";
  home.stateVersion = "22.05";
  news.display = "silent";
  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
    ./starship.nix
    ./services.nix
    ./gaming.nix
    ../common/wayland
    ../common/alacritty.nix
    ../common/zsh.nix
    ../common/fzf.nix
    ../common/git.nix
    ../common/neovim.nix
    ../common/packages.nix
    ../common/tmux.nix
    ../common/feh.nix
    ../common/gpg-agent.nix
  ];
}
