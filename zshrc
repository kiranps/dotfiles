export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Path to your zsh folder
export ZSH=$HOME/.zsh
export GPG_TTY=$(tty)

# Shell prompt
#source $ZSH/prompt.zsh

# Zsh Plugins
plugins=(git autojump docker-compose)

# Run zsh configurations
source $ZSH/zsh.sh

bindkey '^R' history-incremental-search-backward
bindkey 'jk' vi-cmd-mode

# Start tmux If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux -u -2 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(starship init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-13.0.2.jdk/Contents/Home"

export LC_ALL=en_US.UTF-8

ZSH_THEME="gruvbox"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=/opt/apache-maven-3.6.3/bin:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
