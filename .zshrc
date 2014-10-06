# set PATH variable
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Shell prompt
export PS1="$ "

# Blinking line cursor
echo -e -n "\x1b[\x35 q"

# function start
# set proxy
function gecproxy(){
    export http_proxy="http://etamech037:toxicchemz12345@10.29.1.2:3128"
    export https_proxy="https://etamech037:toxicchemz12345@10.29.1.2:3128"
    export ftp_proxy="ftp://etamech037:toxicchemz12345@10.29.1.2:3128"
    sudo cp /etc/apt/apt.conf.gec /etc/apt/apt.conf
}

# Unset proxy
function noproxy(){ 
    export http_proxy=""
    export https_proxy=""
    export ftp_proxy=""
    sudo rm /etc/apt/apt.conf
}

# Make a new dir and move in to it
# function end


# Lines configured by zsh-newuser-install HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 5
zstyle :compinstall filename '/home/kiran/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
