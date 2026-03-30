{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    # opencode integration
    {
      plugin = opencode-nvim;
      type = "lua";
      config = ''
        vim.api.nvim_create_user_command("OpenCodeAsk", function(opts)
          local prompt = (opts.args ~= "" and opts.args) or "@this: "
          require("opencode").ask(prompt, { submit = true })
        end, {
           desc = "Ask opencode…",
           range = true,
        })

        vim.api.nvim_create_user_command("OpenCodeToggle", function(opts)
          require("opencode").toggle()
        end, {
           desc = "Toggle opencode…"
        })

        vim.api.nvim_create_user_command("OpenCodeSelect", function(opts)
          require("opencode").select()
        end, {
           desc = "Select opencode…"
        })

        vim.api.nvim_create_user_command("OpenCodeOperator", function(opts)
          local cmd = require("opencode").operator("@this ", { submit = true })
          if opts.range > 0 then
            vim.cmd("normal! gv")
            vim.api.nvim_feedkeys(cmd, "n", false)
          else
            vim.api.nvim_feedkeys(cmd, "n", false)
          end
        end, {
          desc = "Select opencode…",
          range = true,
        })

        vim.g.opencode_opts = {
          cmd = "opencode --port",
          provider = {
            enabled = "tmux",
            tmux = {
              options = "-h",
              focus = false,
              allow_passthrough = false,
            }
          }
        }
      '';
    }

    # avante AI assistant
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
        model = "gpt-4.1"
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
  ];
}
