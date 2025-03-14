setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit
source <(kubectl completion zsh)
complete -C '/usr/local/bin/aws_completer' aws

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

eval "$(starship init zsh)"
export EDITOR=/opt/homebrew/bin/nvim

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias cl='clear'

alias v='nvim'
# VI Mode
bindkey jj vi-cmd-mode

# switch aws profiles
function awsprofile() {
  # Unset AWS environment variables
  unset AWS_PROFILE AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION AWS_DEFAULT_OUTPUT

  if [[ -n "$1" ]]; then
    export AWS_PROFILE="$1"
    echo "Switched to AWS profile: $AWS_PROFILE"

    # Check if profile uses SSO
    if aws configure list-profiles | grep -q "^$AWS_PROFILE$"; then
      if ! aws sts get-caller-identity &>/dev/null; then
        echo "SSO credentials not found. Logging in..."
        aws sso login 2>/dev/null
      else
        echo "SSO credentials are already valid."
      fi
    else
      echo "Profile '$AWS_PROFILE' is not an SSO profile."
    fi
  else
    echo "Cleared AWS profile."
  fi
}
# path
path+=('/opt/homebrew/bin')
path+=("$PYENV_ROOT/bin")
path+=("/Users/dan.blore/git/cpe-devops-scripts/bin")
path+=("/Users/dan.blore/.gem/ruby/2.6.0/bin")
path+=("/Users/dan.blore/.gem/ruby/2.5.0/bin")
path+=("/Users/dan.blore/.config/scripts")
path+=("~/.rd/bin")
path+=("/Users/dan.blore/.gem/ruby/3.3.2/bin")
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/Users/dan.blore/tools/puppet-editor-services:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"


export AWS_DEFAULT_REGION="us-east-1"
export AWS_PAGER=""

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"

# Netskope SSL Decryption Cert
export REQUESTS_CA_BUNDLE=/Users/dan.blore/netskope/certs/nscacert_combined.pem
export CURL_CA_BUNDLE=/Users/dan.blore/netskope/certs/nscacert_combined.pem
export SSL_CERT_DIR=/Users/dan.blore/netskope/certs/nscacert_combined.pem
export PIP_CERT=/Users/dan.blore/netskope/certs/nscacert_combined.pem
export NODE_EXTRA_CA_CERTS=/Users/dan.blore/netskope/certs/nscacert_combined.pem
export GIT_SSL_CAPATH=/Users/dan.blore/netskope/certs/nscacert_combined.pem
export SSL_CERT_FILE=/Users/dan.blore/netskope/certs/nscacert_combined.pem

