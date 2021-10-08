#!/bin/env bash
#
#      _       __             _ _       
#   __| | ___ / _| __ _ _   _| | |_ ___ 
#  / _` |/ _ \ |_ / _` | | | | | __/ __|
# | (_| |  __/  _| (_| | |_| | | |_\__ \
#  \__,_|\___|_|  \__,_|\__,_|_|\__|___/
# 

# Retrieve machine model to generate hostname accordingly
MACHINE=$(sysctl hw.model | cut -d' ' -f2 | sed 's/[0-9]*\,[0-9]//g')
COMPUTER_NAME="${MACHINE}-Filo"

# Close any open System Preferences, to prevent overrindig changes of this script
osascript -e 'tell application "System Preferences" to quit'                                 

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set machine hostname and SMB discovery name
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"

# Set sidebar icon size to small (1:small (default in <10.15), 2:medium (Catalina default), 3:big)
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog (CAUTION when download from unknown sources)
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

##################
# Power settings #
##################

# Enable lid wakeup
sudo pmset -a lidwake 1

# Setup display sleep to 5 minutes for battery and 15 minutes for AC power
sudo pmset -b displaysleep 5
sudo pmset -c displaysleep 15

# Setup machine sleep timer
sudo pmset -b sleep 15
sudo pmset -c sleep 30

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Increase sound quality for Bluetooth headphones/headsets (not needed if using ACC)
#defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Rome" > /dev/null

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "it"
defaults write NSGlobalDomain AppleLocale -string "it_IT@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

###############################################################################
# Screen                                                                      #
###############################################################################

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Reset Finder toolbar layout and add custom config
#/usr/libexec/PlistBuddy -c "Delete :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers" ~/Library/Preferences/com.apple.finder.plist

# Add TB Items Identifiers
defaults write com.apple.finder "NSToolbar Configuration Browser" -dict-add "TB Items Identifiers" "<array>
	<string>com.apple.finder.BACK</string>
	<string>NSToolbarFlexibleSpaceItem</string>
	<string>com.apple.finder.SWCH</string>
	<string>NSToolbarFlexibleSpaceItem</string>
	<string>com.apple.finder.PATH</string>
	<string>NSToolbarFlexibleSpaceItem</string>
	<string>com.apple.finder.ACTN</string>
	<string>com.apple.finder.CNCT</string>
	<string>com.apple.finder.SHAR</string>
	<string>com.apple.finder.SRCH</string> 
</array>"

# Add custom config with "Path" and "Remote Connection" buttons
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string com.apple.finder.BACK" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string NSToolbarFlexibleSpaceItem" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string com.apple.finder.SWCH" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string NSToolbarFlexibleSpaceItem" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string com.apple.finder.PATH" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string NSToolbarFlexibleSpaceItem" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string com.apple.finder.ACTN" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string com.apple.finder.CNCT" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string com.apple.finder.SHAR" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Add :NSToolbar\ Configuration\ Browser:TB\ Item\ Identifiers: string com.apple.finder.SRCH" ~/Library/Preferences/com.apple.finder.plist

# Set Home as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 49" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 49" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 49" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Set icon size to 39 pixels
defaults write com.apple.dock tilesize -int 39

# Enable magnification
defaults write com.apple.dock magnification -bool true

# Set magnification to 50 pixels
defaults write com.apple.dock largesize -int 50

# Minimize windows to their application icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	#"Terminal" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
