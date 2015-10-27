# make a new dir and move in to it
function mkcd
{
    command mkdir $1 && cd $1
}

# find shorthand
function f() {
    find . -name "$1"
}

# credit: http://nparikh.org/notes/zshrc.txt
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# awesome window manager autostart applications only once
run_once() {
    pgrep $@ > /dev/null || ($@ &)
}

#function strip_diff_leading_symbols(){
    #rule=$(printf "%$(tput cols)s\n"|sed -r "s/ /─/g")
    #color_code_regex="(\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])"

    ### simplify the unified patch diff header
    #sed -r "s/^($color_code_regex)diff --git .*$//g" | \
        #sed -r "s/^($color_code_regex)index .*$/\n\1$(rule)/g" | \
        #sed -r "s/^($color_code_regex)\+\+\+(.*)$/\1+++\5\n\1$(rule)\x1B\[m/g" #|\

    ### actually strips the leading symbols
        #sed -r "s/^($color_code_regex)[\+\-]/\1 /g"
#}
