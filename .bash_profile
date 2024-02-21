if [[ "$OSTYPE" == "darwin"* ]]; then
	# needed for brew
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
complete -C '/usr/local/bin/aws_completer' aws

# Change AWS Profile
awscp() {
	PROFILES=($(aws configure list-profiles))

	if [[ $# -eq 0 ]]; then
		SELECTED_PROFILE=$(printf '%s\n' "${PROFILES[@]}" | fzf --prompt="Select AWS profile: ")
		export AWS_PROFILE=$SELECTED_PROFILE
		export AWS_DEFAULT_PROFILE=$SELECTED_PROFILE
		printf "\nAWS Profile changed to %s \n\n" $SELECTED_PROFILE
	else
		export AWS_PROFILE=$1
		export AWS_DEFAULT_PROFILE=$1
		printf "\nAWS Profile changed to %s \n\n" $1
	fi
}

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
