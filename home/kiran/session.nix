{pkgs, ...}: {
  home.sessionVariables = {
    PATH = "$PATH:/home/kiran/Android/sdk/emulator:/home/kiran/Android/sdk/build-tools/bin:/home/kiran/Android/sdk/platform-tools:/home/kiran/Android/sdk/cmdline-tools/latest/bin:/home/kiran/.cargo/bin";
    LD_LIBRARY_PATH = "${pkgs.glib}/lib:$LD_LIBRARY_PATH";
    PNPM_HOME = "$HOME/.local/share/pnpm";
  };
}
