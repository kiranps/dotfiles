{pkgs, ...}: {
  home.packages = with pkgs; [
    android-studio
    watchman
    openjdk17
    gradle
  ];
  home.sessionVariables = {
    ANDROID_HOME = "/home/kiran/Android/sdk";
    PATH = "$PATH:/home/kiran/Android/sdk/emulator:/home/kiran/Android/sdk/build-tools/bin:/home/kiran/Android/sdk/platform-tools:/home/kiran/Android/sdk/cmdline-tools/latest/bin";
  };
}
