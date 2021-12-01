#!/usr/bin/env bash

# Define dotfiles folder
DOTFILES_FOLDER=$(pwd)
# Check machine type (Intel or Apple Silicon)
APPLE_ARCH=$(uname -m)

# Ask for administrator password upfront
sudo -v
# Keep-alive: update sudo timestamp until .macos has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check if running bash, otherwise change the default shell
case "${SHELL}" in
  (*bash) ;;
  (*) chsh -s "$(which bash)";;
esac

# Install Homebrew Package Manager
if ! which brew > /dev/null; then
	echo "Installing Homebrew...\n"
	true | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	if [ "$APPLE_ARCH" = "arm64" ]; then
		# Add /opt/homebrew/bin to PATH in order to invoke brew
		export PATH="/opt/homebrew/bin:${PATH}"
	fi
else
	echo "Homebrew already installed, skipping...\n"
fi

# Update and install apps via Homebrew with Brewfile
brew update
echo "Installing favorite apps from Brewfile...\n"
brew bundle install -v

# Check if everything is installed and up to date
brew bundle check --verbose

# Clean downloads and cache files
brew cleanup --prune=all

# Setup macos defaults
echo "Setup macOS system preferences with defaults...\n"
source defaults.sh

# Add items to the dock
echo "Add favorite apps to the Dock...\n"
source dock.sh

# Apply app-specific customizations (Bookmarks, Extensions, etc.)
echo "Customize some apps...\n"
source app_setup.sh

# Link dotfiles in the HOME folder
echo "Linking dotfiles in the \$HOME folder...\n"
for file in {.bash_profile,.config,.vimrc,.tmux.conf}; do
	ln -s "$DOTFILES_FOLDER/${file}" "$HOME/${file}"
done

