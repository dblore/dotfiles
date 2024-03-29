#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# history
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias v='nvim'
alias vim='v'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"

PROMPT_COMMAND='__git_ps1 "\[\e[33m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\]:\[\e[35m\]\W\[\e[0m\]" " \n$ "'

# path
PATH="${PATH:+${PATH}:}${PYENV_ROOT}/bin"

# cd
alias ..='cd ..'

# ls
alias ls='ls --color=auto'
alias ll='ls -la'

alias t='tmux'

# ricing
alias sbr='source ~/.bashrc'

# kubectl
alias k='kubectl'
complete -o default -F __start_kubectl k
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kc='kubectx'
