{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    vim-fugitive
    vim-rhubarb
    nerdcommenter
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require('gitsigns').setup()
      '';
    }
  ];
}
