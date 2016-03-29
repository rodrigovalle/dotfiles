# ~/.zshrc
# Author: Rodrigo Valle

# (temporary) prompt
PROMPT="%n@%m:%~%# "
RPROMPT="[%?]"

# fish-like syntax highlighting in zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# set LS_COLORS
d=.dir_colors
test -r $d && eval "$(dircolors $d)"

## ALIASES
alias vi="vim"
alias ls="ls -p --group-directories-first --color=always"
alias chrome="chromium &>/dev/null &"
alias xup="xrdb ~/.Xresources"

