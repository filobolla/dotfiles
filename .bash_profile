# Launch tmux session if installed
#if ( command -v tmux &> /dev/null ); then tmux; fi

# TODO: Add syscripts to $PATH (move scripts to dotfiles/bin folder)

#########
# Shell #
#########

# Customize prompt
source ~/.bash_prompt
# Import aliases
source ~/.bash_aliases
# Disable bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1;
# Ignore history duplicates and command beginning with space
export HISTCONTROL='ignoreboth';

# Add brew bash completions
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Disable less history file
export LESSHISTFILE=-

