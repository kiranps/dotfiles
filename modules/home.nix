{ pkgs, ... }:

{
  users.users.kiranps = {
    name = "kiranps";
    home = "/Users/kiranps";
  };

  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;
      minimize-to-application = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "skynet";

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs;
      [
        (nerdfonts.override {
          fonts = [ "Inconsolata" "Iosevka" "VictorMono" ];
        })
      ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  programs.zsh.enable = true;

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;
  home-manage.users.kiranps.import = [./neovim.nix];

  home-manager.users.kiranps = { pkgs, ... }: {
    programs.home-manager.enable = true;
    home.stateVersion = "22.05";
    programs.ssh = { enable = true; };
    programs.autojump.enable = true;

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      colors = {
        fg = "#ebdbb2";
        bg = "#282828";
        hl = "#fabd2f";
        "fg+" = "#ebdbb2";
        "bg+" = "#3c3836";
        "hl+" = "#fabd2f";
        info = "#83a598";
        prompt = "#bdae93";
        spinner = "#fabd2f";
        pointer = "#83a598";
        marker = "#fe8019";
        header = "#665c54";
      };
    };

    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "vi-mode" ];
      };

      shellAliases = {
        v = "nvim";
        lsl = "exa --long --sort=mod --icons";
      };

      initExtra = ''
        bindkey 'jk' vi-cmd-mode
        eval "$(starship init zsh)"

        export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
        gpgconf --launch gpg-agent
        export PATH=~/bin:$HOME/.npm-global/bin:$PATH
      '';
    };

    programs.tmux = {
      enable = true;
      keyMode = "vi";
      terminal = "screen-256color";

      extraConfig = ''
        bind | split-window -h -c '#{pane_current_path}'
        bind - split-window -v -c '#{pane_current_path}'

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind -r H resize-pane -L 5
        bind -r J resize-pane -D 5
        bind -r K resize-pane -U 5
        bind -r L resize-pane -R 5

        set-option -g status-interval 5
        set-option -g automatic-rename on
        set-option -g automatic-rename-format '#{b:pane_current_path}'

        set-option -sg escape-time 10
        set-option -sa terminal-overrides ',alacritty:RGB'

        set -g pane-border-style fg='colour236'
        set -g pane-active-border-style bg=default,fg='colour236'
        set -g pane-active-border-style "bg=default fg=colour239"

        set -g status 'on'
        set -g status-justify 'left'
        set -g status-left-length '100'
        set -g status-right-length '100'
        set -g status-fg 'colour237'
        set -g status-bg 'colour236'
        set -g status-left "#[fg=colour238,bg=colour245,bold] ❐ #S #[bg=colour239] #[bg=colour236] "
        set -g status-right "#[fg=colour245,bg=colour238] %y-%m-%d #[fg=colour245,bg=colour237] %I:%M %p  #[fg=colour245,bg=colour238] #h "

        setw -g window-status-separator " "
        setw -g window-status-format '#[fg=colour235,bg=colour243] #I #[fg=colour245,bg=colour238] #W '
        setw -g window-status-current-format '#[fg=colour246,bg=colour238] #I #[fg=colour235,bg=colour244] #W '

        set-option -g update-environment "DIRENV_DIFF DIRENV_DIR DIRENV_WATCHES"
        set-environment -gu DIRENV_DIFF
        set-environment -gu DIRENV_DIR
        set-environment -gu DIRENV_WATCHES
        set-environment -gu DIRENV_LAYOUT
      '';
    };

    programs.git = {
      enable = true;
      userName = "Kiran PS";
      userEmail = "pskirann@gmail.com";
      signing.key = "7DCD9B6055EC67328B11479C98F39D21572A62F5";
      signing.signByDefault = true;
      extraConfig.github.user = "kiranps";
    };

    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 4;
            y = 0;
          };
          decorations = "buttonless";
        };
        scrolling.history = 100000;
        live_config_reload = true;
        selection.save_to_clipboard = true;
        mouse.hide_when_typing = true;
        use_thin_strokes = true;

        font = {
          size = 16;
          normal.family = "VictorMono Nerd Font";
          bold.family = "VictorMono Nerd Font";
          italic.family = "VictorMono Nerd Font";
        };

        colors = {
          cursor.cursor = "#81a1c1";

          primary = {
            background = "#282828";
            foreground = "#ebdbb2";
          };

          bright = {
            black = "#928374";
            red = "#fb4934";
            green = "#b8bb26";
            yellow = "#fabd2f";
            blue = "#83a598";
            magenta = "#d3869b";
            cyan = "#8ec07c";
            white = "#ebdbb2";
          };
        };
      };
    };

    home.packages = with pkgs;
      [
        jq
        wget
        skhd
        keybase
        kbfs
        tldr
        openvpn
        gnupg
        awscli2
        fx
        pinentry-curses
        nodejs
        ripgrep
        gh
        poetry
        inetutils
        mozjpeg
        geos
        ssm-session-manager-plugin
        nomad
        bat
        exa
        fd
        htop
        ffmpeg
        libheif
        imagemagick
        hey
        pgcli
        postgresql
        drone-cli
        go_1_18
        vscode
        diskonaut
        sketchybar
      ] ++ [ (import ./python-packages.nix { pkgs = pkgs; }) ];

      #xdg.configFile."sketchybar/sketchybarrc".text = "hello";
  };
}
