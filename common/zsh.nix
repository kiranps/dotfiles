{ pkgs, ... }: {

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
    };

    shellAliases = {
      v = "nvim";
      tmux = "tmux -u";
      lsl = "eza --long --sort=mod --icons";
      copy2clip = "xsel --clipboard";
      clipsend = "kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --send-clipboard";
    };

    initContent = ''
      bindkey 'jk' vi-cmd-mode
      eval "$(starship init zsh)"

      ### use ssh key from gpg
      # export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent
      ###

      export PATH=~/bin:$HOME/.npm-global/bin:$PATH
    '';
  };

}
