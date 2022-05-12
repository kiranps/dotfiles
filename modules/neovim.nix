{ pkgs, home-manager, ... }:

{
  home-manager.users.kiranps.programs.neovim = {
    enable = true;
    package = pkgs.neovim; # use neovim from flake

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

          set signcolumn=yes
          autocmd FileType nerdtree setlocal signcolumn=no

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
          vim.o.background = "dark"
          vim.cmd([[colorscheme gruvbox]])
        '';
      }
      #{
      #plugin = nerdtree;
      #type = "lua";
      #config = ''
      #vim.cmd([[
      #nmap <Leader>k :NERDTreeToggle<CR>
      #]])
      #'';
      #}
      {
        plugin = nvim-treesitter;
        type = "lua";
        config = ''
          	require'nvim-treesitter.configs'.setup {
                    ensure_installed = "maintained",
                    sync_install = false,
                    highlight = {
                      enable = true,
                      additional_vim_regex_highlighting = false,
                    },
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
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      lspsaga-nvim
      {
        plugin = luasnip;
        type = "lua";
        config = ''
           require'lspsaga'.init_lsp_saga {}

           vim.cmd([[
            nnoremap <silent> gh :Lspsaga lsp_finder<CR>
            nnoremap <silent>K :Lspsaga hover_doc<CR>
            nnoremap <silent><leader>ca :Lspsaga code_action<CR>
            vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
            nnoremap <silent> gd :Lspsaga preview_definition<CR>
           ]])

          local cmp = require 'cmp'
          local luasnip = require("luasnip")

          local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
          end

          cmp.setup({
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            mapping = {
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif has_words_before() then
                  cmp.complete()
                else
                  fallback()
                end
              end, { "i", "s" }),
            },
            sources = {
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            },
          })

          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
      neovim
      rnix-lsp
      nixfmt
      tree-sitter
      python3Packages.black
      nodePackages.pyright
    ];
  };
}
