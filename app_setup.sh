#!/bin/sh

# Install vscode extensions
cat vs_code_extensions_list.txt | xargs -n 1 code --install-extension

# TODO:
# - Add favorites folders and toolbar items to Finder
# - Scripting Launchpad folder creations

# Check if the Public folder is mounted to import the needed files
if ! test -d /Volumes/Public; then
	open 'smb://filippo@192.168.3.4/Public' # NEEDS PASSWORD!
fi

# - Import Cyberduck bookmarks
# Check if Cyberduck is running, then move Bookmark folder
if test find /Applications -type d -maxdepth 1 -name "Cyberduck.app">/dev/null; then
## IMPORTANT: check permissions after import and set them accordingly
# cp /Volumes/Public/Filippo/dotfiles_backup/Cyberduck/Bookmarks "${HOME}/Library/Application Support/CyberDuck/"
fi

# - Import Brave bookmarks and preferences
if test find /Applications -type d -maxdepth 1 -name "Brave Browser.app">/dev/null; then
# mv /Volumes/Public/Filippo/dotfiles_backup/Brave-Browser/Bookmarks "${HOME}/Library/Application Support/BraveSoftware/Brave-Browser/Default/"
# mv /Volumes/Public/Filippo/dotfiles_backup/Brave-Browser/Preferences "${HOME}/Library/Application Support/BraveSoftware/Brave-Browser/Default/"

# - Import massCode database
if test find /Applications -type d -maxdepth 1 -name "massCode.app">/dev/null; then
# mv /Volumes/Public/Filippo/dotfiles_backup/massCode "${HOME}/"

# - Import mail folders
# mv /Volumes/Public/Filippo/dotfiles_backup/Mail/V6 ${HOME}/Library/Mail/
