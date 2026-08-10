{
  pkgs,
  config,
  ...
}: {
  home.sessionVariables = {
    LD_LIBRARY_PATH = "${pkgs.glib}/lib:$LD_LIBRARY_PATH";
    PNPM_HOME = "$HOME/.local/share/pnpm";
    NODE_OPTIONS = "--max-old-space-size=512";
    #PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    PKG_CONFIG_PATH = "${config.home.profileDirectory}/lib/pkgconfig";
    OLLAMA_MODELS = "/d/ollama/models";
    PATH =
      "$PATH:"
      + "${config.home.homeDirectory}/Android/Sdk/emulator:"
      + "${config.home.homeDirectory}/Android/Sdk/build-tools/bin:"
      + "${config.home.homeDirectory}/Android/Sdk/platform-tools:"
      + "${config.home.homeDirectory}/Android/Sdk/cmdline-tools/latest/bin:"
      + "${config.home.homeDirectory}/.cargo/bin:"
      + "${config.home.homeDirectory}/.local/share/pnpm:"
      + "${config.home.homeDirectory}/.bun/bin:";
  };
}
