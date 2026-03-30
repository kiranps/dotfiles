{pkgs, ...}: {
  programs.neovim.extraPackages = with pkgs; [
    gcc
    nixd
    nixfmt
    tree-sitter
    lua-language-server
    nodePackages.prettier
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
}
