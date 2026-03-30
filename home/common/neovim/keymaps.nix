{pkgs, ...}: {
  programs.neovim.extraConfig = ''
    lua << EOF
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

        nnoremap <leader>j <cmd>lua require('telescope.builtin').find_files()<cr>
        nnoremap <leader>l <cmd>lua require('telescope.builtin').live_grep()<cr>
      ]])
    EOF
  '';
}
