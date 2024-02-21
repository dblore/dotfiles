# path
path+=('/opt/homebrew/bin')
path+=("$PYENV_ROOT/bin")

# history
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace
setopt HIST_FIND_NO_DUPS

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias v='nvim'
alias vim='v'

# pyenv
eval "$(pyenv init -)"

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
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kc='kubectx'

