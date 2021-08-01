# Launch tmux session if installed
#if ( command -v tmux &> /dev/null ); then tmux; fi
# Customize prompt
source ~/.bash_prompt
# Import aliases
source ~/.bash_aliases

# Add brew bash completions
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Disable less history file
export LESSHISTFILE=-
