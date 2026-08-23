{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    android-studio
    watchman
    openjdk17
    gradle
  ];
  home.sessionVariables = {
    ANDROID_HOME = "${config.home.homeDirectory}/Android/Sdk";
    ANDROID_NDK_HOME = "${config.home.homeDirectory}/Android/Sdk/ndk/30.0.15729638";
  };
}
