#!/bin/bash
#
#     _            _    
#  __| | ___   ___| | __
# / _` |/ _ \ / __| |/ /
#| (_| | (_) | (__|   < 
# \__,_|\___/ \___|_|\_\
#

APPLE_ARCH=$(uname -m)
# App paths list
APP_LIST=("Brave Browser" "Mail" "Notes" "Visual Studio Code" "Terminal" "TextEdit" "Activity Monitor" "Microsoft Teams" "Telegram" "Typora" "Microsoft Remote Desktop");
# For legacy systems, all apps are in /Applications, in Big Sur universal apps are in /System/Applications

# Empty Dock persistent apps
defaults write com.apple.dock persistent-apps -array

# Add apps to the Dock
for app in "${APP_LIST[@]}"; do
		APP_PATH=$(find "/Applications" "/System/Applications" -type d -name "${app}.app")

	defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${APP_PATH}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

# After adding programs, restart Dock
killall Dock
