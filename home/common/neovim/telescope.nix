{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
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
  ];
}
