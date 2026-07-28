{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Colorscheme
    {
      plugin = gruvbox-nvim;
      type = "lua";
      config = ''
        vim.cmd.colorscheme "gruvbox"
      '';
    }

    # Status line
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

    # File tree
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

    # Syntax highlighting
    {
      plugin = nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-lua
        p.tree-sitter-c
        p.tree-sitter-python
        p.tree-sitter-bash
        p.tree-sitter-json
        p.tree-sitter-yaml
        p.tree-sitter-markdown
        p.tree-sitter-html
        p.tree-sitter-css
        p.tree-sitter-javascript
        p.tree-sitter-typescript
        p.tree-sitter-rust
        p.tree-sitter-go
      ]);
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

    # Indent guides
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = ''
        vim.cmd [[highlight IndentBlanklineChar guifg=#383838 gui=nocombine]]
      '';
    }

    # Diagnostics panel
    {
      plugin = trouble-nvim;
      type = "lua";
      config = ''
        require("trouble").setup {
          mode = "document_diagnostics"
        }
      '';
    }

    # Startup screen
    vim-startify

    # LSP progress indicator
    {
      plugin = fidget-nvim;
      type = "lua";
      config = ''
        require"fidget".setup{}
      '';
    }

    nvim-navic
  ];
}
