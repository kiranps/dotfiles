{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Completion sources
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-treesitter

    # Completion engine
    {
      plugin = nvim-cmp;
      type = "lua";
      config = ''
        local cmp = require 'cmp'
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local servers = { 'clangd', 'pyright', "ruff", 'lua_ls', 'nixd', 'terraformls', 'gopls', 'tsserver'}
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

    # Formatting
    {
      plugin = conform-nvim;
      type = "lua";
      config = ''
        require('conform').setup({
          formatters_by_ft = {
            python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
            javascript = { "biome" },
            typescript = { "biome" },
            javascriptreact = { "biome" },
            typescriptreact = { "biome" },
            json = { "biome" },
            jsonc = { "biome" },
            go = { "gofumpt" },
            terraform = { "terraform_fmt" },
            nix = { "alejandra" },
            rust = { "rustfmt", lsp_format = "fallback" },
            xml = { "xmllint" },
          },
          format_on_save = {
            timeout_ms = 5000
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

    # LSP UI (hover, goto-def, rename, code actions)
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

    # Function signature hints
    {
      plugin = lsp_signature-nvim;
      type = "lua";
      config = ''
        require "lsp_signature".setup()
      '';
    }

    # Language-specific LSP enhancements
    rustaceanvim
    {
      plugin = typescript-tools-nvim;
      type = "lua";
      config = ''
        require("typescript-tools").setup({})
      '';
    }

    # uv integration
    {
      plugin = uv-nvim;
      type = "lua";
      config = ''
        require('uv').setup()
      '';
    }
  ];
}
