{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    #android-studio
    watchman
    openjdk17
    gradle
  ];
  home.sessionVariables = {
    ANDROID_HOME = "${config.home.homeDirectory}/Android/Sdk";
  };
}
