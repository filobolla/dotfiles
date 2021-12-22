#!/bin/bash

# If Public folder isnot mounted, grab password and 
if test ! -d "/Volumes/Public" ; then
pw=$(security 2>&1 >/dev/null find-internet-password -a filippo -l "CasaBolla-NAS" -g | cut -d'"' -f2)

open 'smb://filippo:'"${pw}"'@casabolla-nas/Public'
# unset variable to avoid pw leaks
unset pw

fi

sleep 2
# If folder continues to be missing, abort
if test ! -d "/Volumes/Public" ; then
	echo "Public folder continues to be missing, aborting backup..."
	exit 1
else
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
# Add dash to name space to declare a space-separated array
arrName=($(echo "$names" | sed 's/ /-/g' | sed 's/\,-/ /g'))

for index in "${!arrName[@]}"; do
	rsync -auhP --exclude="Deleted*.mbox" --exclude="Drafts.mbox" "${paths[index]}/" "/Volumes/Public/Filippo/dotfiles_backup/Mail/${arrName[index]}/" --delete-excluded --delete-after
done
fi
