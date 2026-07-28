{pkgs, ...}: {
  programs.neovim.extraPackages = with pkgs; [
    gcc
    nixd
    nixfmt
    tree-sitter
    lua-language-server
    prettier
    pyright
    terraform-ls
    gopls
    typescript
    typescript-language-server
    alejandra
    ruff
    rustfmt
    libxml2
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    vim-godot
  ];
}
