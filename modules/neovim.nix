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
      #LSP
      fidget-nvim
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local lspconf = require 'lspconfig'
          local servers = { 'clangd', 'pyright', 'tsserver' }

          local capabilities = require('cmp_nvim_lsp').default_capabilities()

          for _, lsp in ipairs(servers) do
            lspconf[lsp].setup {
              capabilities = capabilities,
              onattach = onattach,
            }
          end

          -- luasnip setup
          local luasnip = require 'luasnip'

          -- nvim-cmp setup
          local cmp = require 'cmp'
          cmp.setup {
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
              ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
              -- C-b (back) C-f (forward) for snippet placeholder navigation.
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              },
              ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end, { 'i', 's' }),
              ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { 'i', 's' }),
            }),
            sources = {
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            },
          }
        '';
      }
      {
        plugin = lspsaga-nvim-original;
        type = "lua";
        config = ''
          local keymap = vim.keymap.set
          local saga = require('lspsaga')

          saga.init_lsp_saga()

          keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
          keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
          keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
          -- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
          keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>",{ silent = true })

          keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
          keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
          keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
          keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
          keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
          keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
          keymap("n", "[E", function()
            require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
          end, { silent = true })
          keymap("n", "]E", function()
            require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
          end, { silent = true })

          lightbulb = {
            enable = true,
            enable_in_insert = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
          },

        '';
      }
      lspsaga-nvim-original
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
