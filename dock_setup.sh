#!/bin/sh
#
#     _            _    
#  __| | ___   ___| | __
# / _` |/ _ \ / __| |/ /
#| (_| | (_) | (__|   < 
# \__,_|\___/ \___|_|\_\
#

# App list
APP_LIST=("Brave Browser" "Mail" "Notes" "Visual Studio Code" "Terminal" "TextEdit" "Activity Monitor" "Microsoft Teams" "Telegram" "Typora" "Microsoft Remote Desktop");
# Empty Dock persisten apps
defaults write com.apple.dock persistent-apps -array

# Add apps to the Dock
for app in $APP_LIST; do
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/${app}.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

# After adding programs, restart Dock
killall Dock
