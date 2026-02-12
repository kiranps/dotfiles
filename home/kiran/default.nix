{
  config,
  pkgs,
  ...
}: {
  home.username = "kiran";
  home.homeDirectory = "/home/kiran";
  home.stateVersion = "22.05";
  news.display = "silent";

  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
    ./starship.nix
    ./services.nix
    ./gaming.nix
    ./session.nix
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
    ../common/android.nix
  ];
}
