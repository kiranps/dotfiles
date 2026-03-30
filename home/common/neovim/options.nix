{pkgs, ...}: {
  programs.neovim.extraConfig = ''
    lua << EOF
      vim.o.number = true
      vim.g.mapleader = ' '
      vim.opt.termguicolors = true
      vim.opt.laststatus = 3

      vim.cmd([[
        set autoindent
        set smartindent
        set smarttab
        set shiftwidth=4
        set softtabstop=4
        set tabstop=4
        set expandtab
        set nobackup
        set noswapfile
        set relativenumber
        set signcolumn=yes
      ]])
    EOF
  '';
}
