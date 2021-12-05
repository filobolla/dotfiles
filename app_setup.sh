#!/bin/bash

# Setup Terminal theme
osascript << EOD
tell application "Terminal"
	set themeName to "Gruvbox Dark"
	local allOpenedWindows
	local initialOpenedWindows
	local windowID

	(* Store window IDs of open terminal windows *)
	set initialOpenedWindows to id of every window

	(* Open the theme.terminal file to import Gruvbox Dark styles *)
	do shell script  "open '$DOTFILES_FOLDER/" & themeName & ".terminal'"

	(* Wait a second for the theme to be loaded *)
	delay 1

	(* Set Gruvbox Dark as default theme *)
	set default settings to settings set themeName 
	
	(* Get IDs of all opened term windows: open adds two new windows *)
	set allOpenedWindows to id of every window
	
	repeat with windowID in allOpenedWindows
		(* Close additional terminal windows *)
		if initialOpenedWindows does not contain windowID then
			close (every window whose id is windowID)

		(* Set Gruvbox theme to all other open windows*)
		else
			set current settings of tabs of (every window whose id is windowID) to settings set themeName
		end if
	end repeat
end tell
EOD

# Install vscode extensions
cat Codefile | xargs -n 1 code --install-extension

# Check if the Public folder is mounted to import the needed files
if ! test -d /Volumes/Public; then
	open 'smb://filippo@casabolla-nas/Public' # NEEDS PASSWORD!
fi

# - Import Cyberduck bookmarks
# Check if Cyberduck is running, then move Bookmark folder
if test $(find /Applications -type d -maxdepth 1 -name "Cyberduck.app">/dev/null); then
	## IMPORTANT: check permissions after import and set them accordingly
	cp /Volumes/Public/Filippo/dotfiles_backup/Cyberduck/Bookmarks "${HOME}/Library/Group Containers/G69SCX94XU.duck/Library/Application Support/duck/"
else
	echo -e "Cyberduck not installed, skipping import...\n"
fi

# - Import massCode database
if test $(find /Applications -type d -maxdepth 1 -name "massCode.app">/dev/null); then
	cp -R /Volumes/Public/Filippo/dotfiles_backup/massCode "${HOME}/"
else
	echo -e "massCode not installed, skipping import...\n"
fi

# - Import wallpapers and setup
rsync -auhP "/Volumes/PUblic/Filippo/dotfiles_backup/Wallpapers" "${HOME}/"

source wallpaper.sh
# - Import mail folders
#cp -R /Volumes/Public/Filippo/dotfiles_backup/Mail/V6 ${HOME}/Library/Mail/
#cp -R /Volumes/Public/Filippo/dotfiles_backup/Accounts ${HOME}/Library/

