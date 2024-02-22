# path
path+=('/opt/homebrew/bin')
path+=("$PYENV_ROOT/bin")

# auto complete
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/config/completion.zsh

# aws completion
complete -C '/usr/local/bin/aws_completer' aws

# kubectl completion
source <(kubectl completion zsh)

# history
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export HISTSIZE=25000
export SAVEHIST=25000
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree ~' # https://www.zsh.org/mla/workers/2023/msg00282.html
alias v='nvim'
alias vim='v'
alias zshc='v $ZDOTDIR/.zshrc'
alias zshr='source $ZDOTDIR/.zshrc'

# pyenv
eval "$(pyenv init -)"

# cd
alias ..='cd ..'

# ls
alias ls='ls --color=auto'
alias ll='ls -la'

alias t='tmux'

# kubectl
alias k='kubectl'
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kc='kubectx'

# navigation
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# prompt
eval "$(starship init zsh)"

# vi mode
bindkey -v
export KEYTIMEOUT=1
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# change cursor mode
source $ZDOTDIR/plugins/cursor-mode

# syntax highlighting
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
