#!/bin/env bash

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
brew cleanup
