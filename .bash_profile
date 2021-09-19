# Launch tmux session if installed
#if ( command -v tmux &> /dev/null ); then tmux; fi

#########
# Shell #
#########
# Set dotfiles folder globally
export DOTFILES_FOLDER=${HOME}/dotfiles

# Add env variables
source $DOTFILES_FOLDER/export
# Customize prompt
source $DOTFILES_FOLDER/prompt
# Import aliases
source $DOTFILES_FOLDER/aliases

# Disable bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1;
# Ignore history duplicates and command beginning with space
export HISTCONTROL='ignoreboth';

# Add brew bash completions
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

############
# Less-Man #
############

# Disable less history file
export LESSHISTFILE=-

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';
