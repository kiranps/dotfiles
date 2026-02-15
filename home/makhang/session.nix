{pkgs, ...}: {
  home.sessionVariables = {
    LD_LIBRARY_PATH = "${pkgs.glib}/lib:$LD_LIBRARY_PATH";
    PNPM_HOME = "$HOME/.local/share/pnpm";
    NODE_OPTIONS = "--max-old-space-size=512";
    PATH = "$PNPM_HOME:$PATH";
  };
}
