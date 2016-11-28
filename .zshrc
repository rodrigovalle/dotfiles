#~/.zshrc
# Author: Rodrigo Valle
#
# TODO: vi-mode bindings
# https://dougblack.io/words/zsh-vi-mode.html

# zsh options
setopt extended_glob
setopt prompt_subst

autoload -Uz colors && colors
autoload -Uz vcs_info

# fish-like syntax highlighting in zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshalias

# set LS_COLORS
d=.dir_colors
test -r $d && eval "$(dircolors $d)"

# vim bindings
bindkey -v
export KEYTIMEOUT=1

# cli prompt with vcs_info
# see:
# - http://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
# - http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
PROJECT_DIR="$HOME/projects"
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' disable-patterns "^($PROJECT_DIR)"
zstyle ':vcs_info:git*' formats "%s:%r@%b "
precmd() { vcs_info }

#PROMPT='%{$fg_bold[blue]%}%C/%{$reset_color%} %# '
NEWLINE=$'\n'
PROMPT='%{$fg_bold[blue]%}%1d%{$reset_color%} ${vcs_info_msg_0_}%# '
ZLE_RPROMPT_INDENT=0

# pretty standard prompt
#PROMPT='%n@%m:%~%# '  # a fairly standard prompt
#RPROMPT='[%?]'

# torch
#. /home/rodrigov/torch/install/bin/torch-activate
#. /home/rodrigov/torch-cl/install/bin/torch-activate
