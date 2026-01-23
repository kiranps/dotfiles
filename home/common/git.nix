{pkgs, ...}: {
  programs.git = {
    enable = true;
    signing.key = "D427467DD7929EF0A44CC93653080CE17F7DEA45";
    signing.signByDefault = true;
    settings = {
      user.name = "Kiran PS";
      user.email = "pskirann@gmail.com";
      core.editor = "vim";
      github.user = "kiranps";
      pull.ff = "only";
      url."ssh://git@github.com/".insteadOf = "https://github.com/";
      push.default = "current";
      init.defaultBranch = "main";
    };
  };
}
