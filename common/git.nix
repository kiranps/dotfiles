{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Kiran PS";
    userEmail = "pskirann@gmail.com";
    signing.key = "D427467DD7929EF0A44CC93653080CE17F7DEA45";
    signing.signByDefault = true;
    extraConfig = {
      core.editor = "vim";
      github.user = "kiranps";
      pull.ff = "only";
      url."ssh://git@github.com/".insteadOf = "https://github.com/";
      push.default = "current";
    };
  };
}
