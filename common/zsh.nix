{ pkgs, ... }: {

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "vi-mode" ];
    };

    shellAliases = {
      v = "nvim";
      lsl = "eza --long --sort=mod --icons";
    };

    initExtra = ''
      bindkey 'jk' vi-cmd-mode
      eval "$(starship init zsh)"

      ### use ssh key from gpg
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent
      ###

      export PATH=~/bin:$HOME/.npm-global/bin:$PATH
    '';
  };

}
