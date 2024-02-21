# ########################
# Environment variables  #
# ########################
#
export EDITOR=nvim
export PAGER=less
export ZDOTDIR=$HOME/.config/zsh
export XDG_CONFIG_HOME=$HOME/.config

# remove duplicate entries from $PATH
# zsh uses $path array along with $PATH 
typeset -U PATH path
