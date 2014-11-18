# Set PATH variable
export PATH="$PATH:$HOME/.rvm/bin:\
/opt/adt-bundle-linux-x86_64-20140321/sdk/tools:\
/home/kiran/lib/google_appengine:\
/home/kiran/lib/phantomjs:\
/home/kiran/apps/mongodb/mongodb-linux-x86_64-2.6.5/bin:\
/home/kiran/apps/genymotion/genymotion:\
/home/kiran/bin:"

# Shell prompt
autoload -U colors && colors
#export PS1="%~$ "
#PS1=$'\n'"%/"$'\n$ '
PROMPT=$'\n'"%{$fg_bold[red]%}%/%{$reset_color%}"$'\n$ '

# Blinking line cursor
echo -e -n "\x1b[\x35 q"

# function start
# set proxy
function gecproxy(){
    export http_proxy="http://etamech037:toxicchemz12345@10.29.1.2:3128"
    export https_proxy="https://etamech037:toxicchemz12345@10.29.1.2:3128"
    export ftp_proxy="ftp://etamech037:toxicchemz12345@10.29.1.2:3128"
    sudo cp /etc/apt/apt.conf.gec /etc/apt/apt.conf
    mv /home/kiran/.npmrc.bak /home/kiran/.npmrc
    mv /home/kiran/.bowerrc.bak /home/kiran/.bowerrc
}

# Unset proxy
function noproxy(){ 
    export http_proxy=""
    export https_proxy=""
    export ftp_proxy=""
    sudo rm /etc/apt/apt.conf
    mv /home/kiran/.npmrc /home/kiran/.npmrc.bak
    mv /home/kiran/.bowerrc /home/kiran/.bowerrc.bak
}

# Make a new dir and move in to it
function mkcd
{
  command mkdir $1 && cd $1
}

# function end

## Aliases

# Start python server
alias pyserver='python -m SimpleHTTPServer'

# Clear console
alias c='clear'

# Colorize the ls output ##
alias ls='ls --color=auto'

# Use a long listing format ##
alias ll='ls -la'

# Show hidden files ##
alias l.='ls -d .* --color=auto'

# Create parent directories on demand
alias mkdir='mkdir -pv'

# pass options to free ## 
alias meminfo='free -m -l -t'
 
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
# Get server cpu info ##
alias cpuinfo='lscpu'
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias shutdown='sudo shutdown -h now'
    alias reboot='sudo reboot'
    alias ad='sudo apt-get update'
    alias ag='sudo apt-get update && sudo apt-get upgrade'
    alias ai='sudo apt-get install'
    alias s='sudo shutdown -c'
fi

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## copy with progress bar
alias cp='gcp'

# End of aliases

## tree custom recursively
alias t3='tree -L 3'
alias t2='tree -L 2'
alias t1='tree -L 1'

## view txt file
alias l='less'

## cordova
alias corr='cordova run'
alias corc='cordova create'
alias corpa='cordova platform add android'


# Str tmux If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux -2

xrdb -merge ~/.Xresources
