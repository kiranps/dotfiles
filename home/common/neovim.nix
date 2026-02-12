{
  config,
  lib,
  pkgs,
  ...
}: {
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
        vim.opt.laststatus = 3

        vim.keymap.set("n", "<leader>tt", function()
          vim.cmd("botright 10split | terminal")
          vim.cmd("startinsert")
        end, { desc = "Open terminal at bottom" })
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })


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
      # LLM
      {
        plugin = copilot-vim;
        type = "lua";
        config = ''
          vim.g.copilot_no_tab_map = true
          vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        '';
      }
      {
        plugin = avante-nvim;
        type = "lua";
        config = ''
          require("avante_lib").load()
          require("avante").setup({
          provider = "copilot",
          providers = {
          copilot = {
          enabled = true,
          model = "gpt-5-mini"
          },
          },
          suggestion = {
          debounce = 5000,
          throttle = 5000,
          },
          windows = {
          width = 50,
          },
          })
        '';
      }
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = ''
          vim.keymap.set("n", "<leader>k", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
        '';
      }
      nvim-web-devicons
      plenary-nvim
      nui-nvim

      # Testing
      {
        plugin = neotest;
        type = "lua";
        config = ''
          require("neotest").setup({
            adapters = {
              require("neotest-python")({
                dap = { justMyCode = false },
              }),
            }
          })

          local neotest = require("neotest")

          vim.keymap.set("n", "<leader>tn", function() neotest.run.run() end, { desc = "Run nearest test" })
          vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run file tests" })
          vim.keymap.set("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end, { desc = "Debug nearest test" })
          vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Toggle test summary" })
          vim.keymap.set("n", "<leader>to", neotest.output.open, { desc = "Open test output" })
          vim.keymap.set("n", "<leader>tO", function() neotest.output_panel.toggle() end, { desc = "Toggle output panel" })
          vim.keymap.set("n", "<leader>tl", neotest.run.run_last, { desc = "Run last test" })
          vim.keymap.set("n", "<leader>tW", function() require("neotest").watch.stop() end, { desc = "Stop watching test" })
        '';
      }
      #nvim-nio
      neotest-python

      # UI
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require'nvim-treesitter'.setup {
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
      {
        plugin = trouble-nvim;
        type = "lua";
        config = ''
          require("trouble").setup {
            mode = "document_diagnostics"
          }
        '';
      }
      {
        plugin = uv-nvim;
        type = "lua";
        config = ''
          require('uv').setup()
        '';
      }
      #LSP
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-treesitter
      rustaceanvim
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local cmp = require 'cmp'
          local cmp_nvim_lsp = require("cmp_nvim_lsp")

          local servers = { 'clangd', 'pyright', "ruff", 'lua_ls', 'nixd', 'groovyls', 'terraformls', 'gdscript', 'gopls', 'tsserver'}
          local capabilities = cmp_nvim_lsp.default_capabilities()

          for _, lsp in ipairs(servers) do
            vim.lsp.config(lsp, {
               capabilities = capabilities
            })
            vim.lsp.enable(lsp)
          end

          cmp.setup {
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
                else
                  fallback()
                end
              end, { 'i', 's' }),
              ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end, { 'i', 's' }),
            }),
            sources = {
              { name = 'nvim_lsp' },
              { name = 'treesitter' },
              { name = 'buffer' },
              { name = 'path' },
            },
          }

          vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client == nil then
                return
              end
              if client.name == 'ruff' then
                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false
              end
            end,
            desc = 'LSP: Disable hover capability from Ruff',
          })
        '';
      }
      {
        plugin = conform-nvim;
        type = "lua";
        config = ''
          require('conform').setup({
            formatters_by_ft = {
              python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
              typescript = { "prettier" },
              typescriptreact = { "prettier" },
              javascript = { "prettier" },
              go = { "gofumpt" },
              terraform = { "terraform_fmt" },
              nix = { "alejandra" },
              rust = { "rustfmt", lsp_format = "fallback" },
            }
          })

          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
              require("conform").format({ bufnr = args.buf })
            end,
          })
        '';
      }
      {
        plugin = typescript-tools-nvim;
        type = "lua";
        config = ''
          require("typescript-tools").setup({})
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
      nerdcommenter
      {
        plugin = fidget-nvim;
        type = "lua";
        config = ''
          require"fidget".setup{}
        '';
      }
      #{
      #plugin = nvim-tree-lua;
      #type = "lua";
      #config = ''
      #vim.cmd([[
      #nmap <Leader>k :NvimTreeToggle<CR>
      #hi NvimTreeEndOfBuffer guifg=bg
      #let g:nvim_tree_icons = { 'default': "" }
      #]])

      #require'nvim-tree'.setup {
      #view = {
      #signcolumn = "no"
      #}
      #}
      #'';
      #}

      # Project management
      #{
      #plugin = project-nvim;
      #type = "lua";
      #config = ''
      #require("project_nvim").setup {}
      #require('telescope').load_extension('projects')
      #'';
      #}
      vim-rhubarb
    ];

    extraPackages = with pkgs; [
      gcc
      nixd
      #rnix-lsp
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
    ];
  };
}
