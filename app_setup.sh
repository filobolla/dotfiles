#!/bin/sh

# Install vscode extensions
cat vs_code_extensions_list.txt | xargs -n 1 code --install-extension

# TODO:
# - Add favorites folders and toolbar items to Finder
# - Scripting Launchpad folder creations

# - Import Cyberduck bookmarks
# Check if Cyberduck is running, then move Bookmark folder
if test find /Applications -type d -maxdepth 1 -name "Cyberduck.app">/dev/null; then
# mv Bookmarks "${HOME}/Library/Application Support/CyberDuck/"
fi

# - Import Brave bookmarks and preferences
if test find /Applications -type d -maxdepth 1 -name "Brave Browser.app">/dev/null; then
# mv Bookmarks "${HOME}/Library/Application Support/BraveSoftware/Brave-Browser/Default/"
# mv Preferences "${HOME}/Library/Application Support/BraveSoftware/Brave-Browser/Default/"
