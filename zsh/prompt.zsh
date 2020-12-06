pwdir() {
echo $(pwd | sed -e "s,^$HOME,~,")
}

setopt PROMPT_SUBST
ZLE_RPROMPT_INDENT=0
#RPROMPT=`bcharge`
PROMPT=$'\n''%B%F{1}%n%b%F{4}@%B%F{2}%M%b  %F{7}$(pwdir) %F{4}$(git_prompt_info)%f'$'\n%F{11}%B$%b%f '
#RPROMPT=`bcharge`
#RPROMPT="hi"

# git prompt theme
ZSH_THEME_GIT_PROMPT_PREFIX="git(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# %M - hostname
# %n - username
