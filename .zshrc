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

# cli prompt with git status using the vcs_info zsh package
# see:
# - http://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
# - http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
# - http://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html

DEFAULT_PROMPT='%{$fg_bold[blue]%}%1d%{$reset_color%}'
ZLE_RPROMPT_INDENT=0

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}@%b"

precmd() {
    vcs_info
    if [[ -z ${vcs_info_msg_0_} ]]; then
        # not in a git repository
        PROMPT="$DEFAULT_PROMPT %# "
    else
        # inside a git repo, add status info
        PROMPT="$DEFAULT_PROMPT %# "
        RPROMPT="${vcs_info_msg_0_}"
    fi
}

# pretty standard prompt
#PROMPT='%n@%m:%~%# '  # a fairly standard prompt
#RPROMPT='[%?]'
#
# prompt that only shows the current directory
#PROMPT='%{$fg_bold[blue]%}%C/%{$reset_color%} %# '
#
# torch
#. /home/rodrigov/torch/install/bin/torch-activate
#. /home/rodrigov/torch-cl/install/bin/torch-activate
