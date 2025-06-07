{ config, pkgs, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.kiran = { home.stateVersion = "22.05"; };
  home-manager.users.kiran.imports = [
    ./services.nix
    ../common/alacritty.nix
    ../common/zsh.nix
    ../common/fzf.nix
    ../common/git.nix
    ../common/neovim.nix
    ../common/packages.nix
    ../common/tmux.nix
    ../common/feh.nix
    ../common/gpg-agent.nix
    ./awesome
    ./packages.nix
    ./starship.nix
    ./rofi.nix
    ./grobi.nix
  ];
}
