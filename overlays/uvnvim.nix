final: prev: {
  uv-nvim = prev.vimUtils.buildVimPlugin {
    pname = "uv-nvim";
    version = "2024-07-14";
    src = prev.fetchFromGitHub {
      owner = "benomahony";
      repo = "uv.nvim";
      rev = "main"; # or a pinned commit
    };
    meta.homepage = "https://github.com/benomahony/uv.nvim";
  };
}
