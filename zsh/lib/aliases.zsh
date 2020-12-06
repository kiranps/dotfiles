# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Basic directory operations
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# List direcory contents
alias lsa='ls -lah'
alias lsl='ls -ltrh'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# tmux rename window to current folder
alias trw='tmux rename-window "$(basename `pwd`)"'

# open vim
alias v='basename "$PWD" | trw &&~/bin/nvimbeta/bin/nvim'
#alias v='basename "$PWD" | trw && nvim'
#alias e='emacs -nw'

# google-chrome
alias g="google-chrome"

alias f="firefox"

# Start python server
alias pyserver='python -m SimpleHTTPServer'

# Clear console
alias c='clear'

# list files
alias l='ls'

# Colorize the ls output #
#alias ls='ls --color=auto'

# Use a long listing format #
alias ll='ls -la'

# Show hidden files #
alias l.='ls -d .* --color=auto'

# Create parent directories on demand
alias mkdir='mkdir -pv'

# remove dir
alias rmd="rm -rf"

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias shutdown='sudo shutdown -h now'
    alias suspend='sudo pm-suspend'
    alias reboot='sudo reboot'
    alias ad='sudo apt-get update'
    alias ai='sudo apt-get install'
    alias s='sudo shutdown -c'
fi

# copy with progress bar
#alias cp='gcp'

# tree custom recursively
alias t3='tree -L 3'
alias t2='tree -L 2'
alias t1='tree -L 1'

# services
alias restart_net='sudo service network-manager restart'

#tasks
alias t='python ~/tasks/t.py --task-dir ~/tasks --list tasks'

# open gists
alias gist="vim '+Gist -l'"

# awesome nautilus
alias nautilus='nautilus --no-desktop'

# range cli file manager
alias r='ranger'

# go docker 
alias go='docker run golang go'

alias ctags="`brew --prefix`/bin/ctags"

alias common_db='pgcli postgres://shuttl_user:shuttl_user@0.0.0.0:9221'
alias dockup='docker-compose up --no-deps --build'
