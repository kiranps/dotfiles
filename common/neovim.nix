{ config, lib, pkgs, ... }:

let
  #barbecue-nvim = pkgs.vimUtils.buildVimPlugin {
    #name = "barbecue-nvim";
    #src = pkgs.fetchFromGitHub {
      #owner = "utilyre";
      #repo = "barbecue.nvim";
      #rev = "daeb536b21eae4ba224c6b8f8b2899b5e5770393";
      #hash = "sha256-+F+ENGyuChDEOVkHTpN/psMONn7KgGQyHny7wOCUUlE=";
    #};
  #};
in {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraConfig = ''
      lua << EOF
        vim.o.number = true
        vim.g.mapleader = ' '
        vim.opt.termguicolors = true

        vim.cmd([[

          imap jk <ESC>
          imap kj <ESC>

          nmap <Leader>w :w<CR>
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
      # UI
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
      vim-startify
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = ''
          vim.cmd [[highlight IndentBlanklineChar guifg=#383838 gui=nocombine]]
        '';
      }
      nvim-web-devicons
      {
        plugin = gruvbox-nvim;
        type = "lua";
        config = ''
          vim.cmd.colorscheme "gruvbox"
        '';
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require('lualine').setup {
             theme = "auto",
             options = {
                component_separators = { left = '|', right = '|'},
                section_separators = { left = "", right = ""},
             },
             tabline = {
                 lualine_a = {
                   'buffers'
                 }
             }
          }
        '';
      }
      nvim-navic
      #{
        #plugin = barbecue-nvim;
        #type = "lua";
        #config = ''
          #require("barbecue").setup({
              #symbols = {
                #separator = "",
              #}
          #})
        #'';
      #}
      {
        plugin = trouble-nvim;
        type = "lua";
        config = ''
          require("trouble").setup {
            mode = "document_diagnostics"
          }
        '';
      }

      #LSP
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
      plenary-nvim
      typescript-tools-nvim
      {
        plugin = typescript-tools-nvim;
        type = "lua";
        config = ''
          require("typescript-tools").setup({})
        '';
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local lspconf = require 'lspconfig'
          local servers = { 'clangd', 'pyright', 'lua_ls', 'nixd', 'groovyls', 'terraformls', 'gdscript', 'gopls'}

          local capabilities = require('cmp_nvim_lsp').default_capabilities()

          for _, lsp in ipairs(servers) do
            lspconf[lsp].setup {
              capabilities = capabilities,
              onattach = onattach,
            }
          end

          vim.api.nvim_create_autocmd({"BufWritePre"}, {
            pattern = {"*.tf", "*.tfvars"},
            callback = function()
              vim.lsp.buf.format()
            end,
          })

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
              { name = 'buffer' },
            },
          }
        '';
      }
      {
        plugin = lspsaga-nvim;
        type = "lua";
        config = ''
          require('lspsaga').setup({
              lightbulb = {
                enable = true,
                enable_in_insert = true,
                sign = true,
                sign_priority = 40,
                virtual_text = true,
              },
              hover = {
                auto_open = false,
              }
          })

          local keymap = vim.keymap.set

          keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
          keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
          -- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
          keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true})
          keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>",{ silent = true })

          keymap({"n","v"}, "gC", "<cmd>Lspsaga code_action<CR>", { silent = true })
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

        '';
      }

      {
        plugin = lsp_signature-nvim;
        type = "lua";
        config = ''
          require "lsp_signature".setup()
        '';
      }

      # Fuzzy finder
      telescope-fzf-native-nvim
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

      # Git
      fugitive
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = ''
          require('gitsigns').setup()
        '';
      }
      {
        plugin = neoformat;
        config = ''
          let g:neoformat_enabled_python = ['black']
          let g:neoformat_enabled_typescript = ['prettier']
        '';
      }
      nerdcommenter

      rust-vim

      {
        plugin = fidget-nvim;
        type = "lua";
        config = ''
          require"fidget".setup{}
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

      # Project management
      {
        plugin = project-nvim;
        type = "lua";
        config = ''
          require("project_nvim").setup {}
          require('telescope').load_extension('projects')
        '';
      }
      vim-rhubarb
    ];

    extraPackages = with pkgs; [
      gcc
      nixd
      #rnix-lsp
      nixfmt-classic
      tree-sitter
      sumneko-lua-language-server
      python3Packages.black
      nodePackages.prettier
      pyright
      terraform-ls
      gopls
      typescript
      typescript-language-server
    ];
  };
}
