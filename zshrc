# Export PATH
#
export SCALA_HOME=/usr/local/share/scala
export PATH=$HOME/bin:/usr/local/bin:$HOME/.tmuxifier/bin:/opt/android-sdk/tools:/opt/android-sdk/platform-tools:$SCALA_HOME/bin:$PATH

# Path to your zsh folder
export ZSH=$HOME/.zsh

# Enable 256 color for xterm
export TERM=xterm-256color

# Shell prompt
autoload -U colors && colors
#PROMPT=$'\n'"%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}"$'\n$ '
source $ZSH/prompt.zsh

# Blinking line cursor
# echo -e -n "\x1b[\x35 q"

# Save history
HISTFILE=$HOME/.zhistory # where the file will be saved
HISTSIZE=1000 # the size in bytes it can grow up to
SAVEHIST=1000 # thr maximum number of commands to save I guess

# Zsh Plugins
plugins=(git ruby rvm)

# Run zsh configurations
source $ZSH/zsh.sh

bindkey '^R' history-incremental-search-backward
bindkey 'jk' vi-cmd-mode

# Start tmux If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux -u -2 

# Set colors for ls
eval $(dircolors ~/.dircolors)

# export nvm
. /usr/local/nvm/nvm.sh

# setup tmuxifier
eval "$(tmuxifier init -)"

# setup autojump
. /usr/share/autojump/autojump.zsh

eval $(thefuck --alias)
