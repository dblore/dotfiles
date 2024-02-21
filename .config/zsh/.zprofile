# ########################
# Environment variables  #
# ########################
#
export EDITOR=nvim
export PAGER=less
export ZDOTDIR=$HOME/.config/zsh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export PYENV_ROOT="$HOME/.pyenv"

# remove duplicate entries from $PATH
# zsh uses $path array along with $PATH 
typeset -U PATH path
