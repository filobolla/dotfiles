#!/bin/bash

# Get Mail path via Applescript
ids=$(osascript << EOD 
tell application "Mail"
	tell every account whose account type is pop 
		return account directory
	end tell
end tell
EOD
) 
# Manipulate output to obtain POSIX paths, space-separated
paths=($(echo "$ids" | sed 's/[^ ]*file Macintosh HD//g' | sed 's/\:/\//g' | sed 's/\, / /g'))

# Get account names to backup inboxes to account name folders
names=$(osascript << EOD 
tell application "Mail"
	tell every account whose account type is pop
		return email addresses
	end tell
end tell
EOD
)

# Close Mail before import
osascript -e 'tell application "Mail" to quit'

# Add dash to name space to declare a space-separated array
arrName=($(echo "$names" | sed 's/ /-/g' | sed 's/\,-/ /g'))

for index in "${!arrName[@]}"; do
	rsync -auhP --exclude=".DS_Store" "/Volumes/Public/Filippo/dotfiles_backup/Mail/${arrName[index]}/" "${paths[index]}/" --delete-after
	rm -f "${HOME}/Library/Mail/"V*"/MailData/Envelope "Index*
done
