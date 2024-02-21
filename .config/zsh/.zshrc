# path
path+=('/opt/homebrew/bin')
path+=("$PYENV_ROOT/bin")

# auto complete
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/config/completion.zsh

# history
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export HISTSIZE=25000
export SAVEHIST=25000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree ~' # https://www.zsh.org/mla/workers/2023/msg00282.html
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

# directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# prompt
eval "$(starship init zsh)"

# syntax highlighting
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
