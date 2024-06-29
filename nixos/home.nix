{ pkgs, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.kiran = { home.stateVersion = "22.05"; };
  home-manager.users.kiran.imports = [
    ../common/alacritty.nix
    ../common/fzf.nix
    ../common/git.nix
    ../common/neovim.nix
    ../common/packages.nix
    ../common/tmux.nix
    ../common/zsh.nix
    ./packages.nix
    ./starship.nix
  ];
}
