{ pkgs, home-manager, ... }:

{
  home-manager.users.kiranps.programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraConfig = ''
      lua << EOF
        vim.o.number = true
        vim.g.mapleader = ' '

        vim.cmd([[

          nmap <Leader>w :w<CR>
          imap jk <ESC>
          imap kj <ESC>

          vmap <Leader>y "+y
          nmap <Leader>y "+y
          nmap <Leader>p "+p
          nmap <Leader>P "+P
          vmap <Leader>p "+p

          nmap <Leader><Leader> V
          nmap <Leader>a ggVG

          nmap <Leader>n :bp<CR>
          nmap <Leader>m :bn<CR>
          nmap <Leader>d :bd<CR>

          nmap <Leader>g :Git<CR>

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
          nnoremap <leader>j <cmd>lua require('telescope.builtin').find_files()<cr>
          nnoremap <leader>l <cmd>lua require('telescope.builtin').live_grep()<cr>
        ]])
      EOF
    '';

    plugins = with pkgs.vimPlugins; [
      {
        plugin = gruvbox-nvim;
        type = "lua";
        config = ''
          vim.opt.termguicolors = true
          vim.cmd([[colorscheme gruvbox]])
        '';
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
            require'nvim-treesitter.configs'.setup {
                sync_install = false,
                highlight = {
                    enable = true
                }
            }
        '';
      }
      {
        plugin = vim-airline;
        type = "lua";
        config = ''
          vim.g['airline#extensions#tabline#enabled'] = 1
        '';
      }
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local lspconf = require 'lspconfig'
          local servers = { 'clangd', 'pyright', 'tsserver' }

          for _, lsp in ipairs(servers) do
            lspconf[lsp].setup {
              capabilities = capabilities,
            }
          end
        '';
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          require('telescope').setup {
              extensions = {
                  fzf = {
                      fuzzy = true,
                      override_generic_sorter = true,
                      override_file_sorter = true,
                      case_mode = "smart_case"
                  }
              }
          }
          require('telescope').load_extension('fzf')
          	'';
      }
      fugitive
      nerdcommenter
      indentLine
      telescope-fzf-native-nvim
      vim-airline-themes
      nvim-web-devicons
      rust-vim
      fidget-nvim
      {
        plugin = neoformat;
        config = ''
          let g:neoformat_enabled_python = ['black']
        '';
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''
          vim.cmd([[
            nmap <Leader>k :NvimTreeToggle<CR>
            hi NvimTreeEndOfBuffer guifg=bg
            let g:nvim_tree_icons = { 'default': "" }
          ]])

          require'nvim-tree'.setup {
            view = {
              signcolumn = "no"
            }
          }
        '';
      }
    ];

    extraPackages = with pkgs; [
      gcc
      rnix-lsp
      nixfmt
      tree-sitter
      python3Packages.black
      nodePackages.pyright
    ];
  };
}
