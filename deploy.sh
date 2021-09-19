#!/bin/env bash

# Define dotfiles folder
DOTFILES_FOLDER=$(pwd)

# Ask for administrator password upfront
sudo -v
# Keep-alive: update sudo timestamp until .macos has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run updates before configuration
sudo softwareupdate -i -a

# Check if running bash, otherwise change the default shell
case "${SHELL}" in
  (*bash) ;;
  (*) chsh -s "$(which bash)"; exit 1 ;;
esac

# Install Xcode CLI Tools
xcode-select --install # Might need sudo

# Install Homebrew Package Manager
if ! which brew > /dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update and install apps via Homebrew with Brewfile
brew update
brew bundle install

# Check if everything is installed and up to date
brew bundle check --verbose

# Clean downloads and cache files
brew cleanup --purge=all

# Setup macos defaults
source defaults.sh

# Add items to the dock
source dock.sh

# Apply app-specific customizations (Bookmarks, Extensions, etc.)
source app_setup.sh

# Link dotfiles in the HOME folder
for file in {.bash_profile,.config,.vimrc,.tmux.conf,.gitconfig}; do
	ln -s "$DOTFILES_FOLDER/${file}" "$HOME/${file}"
done

