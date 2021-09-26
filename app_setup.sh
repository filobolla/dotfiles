#!/bin/sh

# Setup Terminal theme
osascript -e <<EOD
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
cat vs_code_extensions_list.txt | xargs -n 1 code --install-extension


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
fi

# - Import massCode database
if test find /Applications -type d -maxdepth 1 -name "massCode.app">/dev/null; then
# mv /Volumes/Public/Filippo/dotfiles_backup/massCode "${HOME}/"
fi

# - Import mail folders
# mv /Volumes/Public/Filippo/dotfiles_backup/Mail/V6 ${HOME}/Library/Mail/

# Create network location for interfacing with RPi without router
sudo networksetup -createlocation "RPi First Connect" populate
sudo networksetup -switchlocation "RPi First Connect"
# Setup manual IPs for wired and WLAN interfaces
sudo networksetup -setmanual "Ethernet Thunderbolt" 192.168.100.201 255.255.255.0 192.168.100.1
sudo networksetup -setmanual "WiFi" 192.168.100.200 255.255.255.0 192.168.100.1
# Return to the automatic location
sudo networksetup -switchtolocation "Automatic"
