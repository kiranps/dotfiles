{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    neotest-python
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
  ];
}
