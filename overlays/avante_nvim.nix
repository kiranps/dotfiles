final: prev: {
  avante_nvim_27 = prev.vimUtils.buildVimPlugin {
    pname = "avante_nvim_27";
    version = "0.0.27";

    src = prev.fetchurl {
      url = "https://github.com/yetone/avante.nvim/releases/download/v0.0.27/avante_lib-linux-x86_64-luajit.tar.gz";
      sha256 = "sha256-ONjj+mBQalJzdm4y60ZQPdYgbFRtCYzL1NkGPeQenwQ=";
    };

    unpackPhase = ''
      mkdir source
      tar -xzf $src -C source
    '';

    # We override the default install to place .so files where Neovim expects them
    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/vim-plugins/$pname
      cp -r ./* $out/share/vim-plugins/$pname

      runHook postInstall
    '';

    meta = with prev.lib; {
      homepage = "https://github.com/yetone/avante.nvim";
      description = "Binary Neovim plugin with Lua51 shared objects";
      platforms = ["x86_64-linux"];
      license = licenses.mit;
    };
  };
}
