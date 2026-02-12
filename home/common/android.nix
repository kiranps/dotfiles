{pkgs, ...}: {
  home.packages = with pkgs; [
    android-studio
    watchman
    openjdk17
    gradle
  ];
  home.sessionVariables = {
    ANDROID_HOME = "/home/kiran/Android/sdk";
  };
}
