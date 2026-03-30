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
    ./services.nix
    ../common/wayland
    ../common/alacritty.nix
    ../common/zsh.nix
    ../common/fzf.nix
    ../common/git.nix
    ../common/neovim
    ../common/packages.nix
    ../common/tmux.nix
    ../common/feh.nix
    ../common/gpg-agent.nix
    ../common/android.nix
    ../common/starship.nix
    ../common/session.nix
  ];
}
