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
# http://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern)
ZSH_HIGHLIGHT_STYLES[unknown-token]='none'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=green'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'

# http://zsh.sourceforge.net/Guide/zshguide05.html#l139
ZSH_HIGHLIGHT_PATTERNS+=('$[a-zA-Z_]##' 'fg=cyan')

# set aliases
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

#PROMPT='%{$fg_bold[blue]%}%1d%{$reset_color%}%# '
PROMPT='%F{white}>%f '
ZLE_RPROMPT_INDENT=0

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}@%b"

precmd() {
    vcs_info
    if [[ -z ${vcs_info_msg_0_} ]]; then
        # not in a git repository
        RPROMPT=""
    else
        # inside a git repo, add status info
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
