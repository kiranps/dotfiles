{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
    };

    shellAliases = {
      v = "nvim";
      q = "exit";
      tmux = "tmux -u";
      lsl = "eza --long --sort=mod --icons";
      copy2clip = "xsel --clipboard";
      clipsend = "kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --send-clipboard";
    };

    initContent = ''
      bindkey 'jk' vi-cmd-mode
      eval "$(starship init zsh)"

      export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt;

      ### use ssh key from gpg
      export GPG_TTY=$(tty)
      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent
      ###

      export PATH=~/bin:$HOME/.npm-global/bin:$PATH

      if [ -f ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
        source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      fi

      # Fix completions for uv run.
      _uv_run_mod() {
          if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
              _arguments '*:filename:_files'
          else
              _uv "$@"
          fi
      }
      compdef _uv_run_mod uv
    '';
  };
}
