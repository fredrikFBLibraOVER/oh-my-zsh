# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="steeef"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn ssh-agent)

source $ZSH/oh-my-zsh.sh

VIMODE="i "
function zle-keymap-select {
    VIMODE="${${KEYMAP/(main|viins)/i }/(vicmd)/}${${KEYMAP/vicmd/c }/(main|viins)/}"
    zle reset-prompt
}
zle -N zle-keymap-select
set -o vi
typeset -A keym
bindkey -M viins "OA" up-line-or-history
bindkey -M viins "OB" down-line-or-history
bindkey -M vicmd "OA" up-line-or-history
bindkey -M vicmd "OB" down-line-or-history

bindkey -M viins "" history-incremental-search-backward
bindkey -M vicmd "" history-incremental-search-backward

function zle-line-init { echoti smkx; }
function zle-line-finish { echoti rmkx; }

zle -N zle-line-init
zle -N zle-line-finish


PROMPT=$'
%{$purple%}%n%{$reset_color%} at %{$orange%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%} $vcs_info_msg_0_
$(virtualenv_info)${VIMODE}$ '

RPROMPT="%{$orange%}[%*]%{$reset_color%}" 
# Customize to your needs...
PATH="${HOME}/bin/:${PATH}"
EDITOR=vim
VISUAL=vim
BC_ENV_ARGS=~/.bcrc
PYTHONSTARTUP="${HOME}/.pythonstartup"
alias dt="dmesg | tail"
alias less="less -r"
ulimit -c unlimited
[ -e /etc/DIR_COLORS ] && eval `dircolors /etc/DIR_COLORS`
[ -e ${HOME}/.dir_colors ] && eval `dircolors ${HOME}/.dir_colors`
