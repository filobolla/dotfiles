#!/bin/env bash

# Check if running bash, otherwise change the default shell
case "${SHELL}" in
  (*bash) ;;
  (*) chsh -s "$(which bash)"; exit 1 ;;
esac

# Check if Xcode CLI Tools are installed
# Install package managers
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

