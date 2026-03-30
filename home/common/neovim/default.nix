{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./ui.nix
    ./lsp.nix
    ./ai.nix
    ./testing.nix
    ./telescope.nix
    ./git.nix
    ./extraPackages.nix
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };
}
