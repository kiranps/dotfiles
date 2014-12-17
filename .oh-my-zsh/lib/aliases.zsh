# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi

# List direcory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias afind='ack-grep -il'

# open vim
alias v='vim'

# Start python server
alias pyserver='python -m SimpleHTTPServer'

# Clear console
alias c='clear'

# Colorize the ls output #
alias ls='ls --color=auto'

# Use a long listing format #
alias ll='ls -la'

# Show hidden files #
alias l.='ls -d .* --color=auto'

# Create parent directories on demand
alias mkdir='mkdir -pv'

# pass options to free # 
alias meminfo='free -m -l -t'

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# get top process eating cpu #
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Get server cpu info #
alias cpuinfo='lscpu'

# get GPU ram on desktop / laptop# 
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

# copy with progress bar
alias cp='gcp'

# End of aliases

# tree custom recursively
alias t3='tree -L 3'
alias t2='tree -L 2'
alias t1='tree -L 1'

# cordova
alias corr='cordova run'
alias corc='cordova create'
alias corpa='cordova platform add android'

# file size
alias du='du -hs'

# mount iso
alias mountiso='mount -o loop'
