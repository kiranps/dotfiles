{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Kiran PS";
    userEmail = "pskirann@gmail.com";
    signing.key = "7DCD9B6055EC67328B11479C98F39D21572A62F5";
    signing.signByDefault = true;
    extraConfig.github.user = "kiranps";
  };
}
