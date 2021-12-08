#!/bin/bash

ids=$(osascript << EOD 
tell application "Mail"
	tell every account whose account type is pop 
		return account directory
	end tell
end tell
EOD
) 
paths=($(echo "$ids" | sed 's/[^ ]*file Macintosh HD//g' | sed 's/\:/\//g' | sed 's/\, / /g'))

names=$(osascript << EOD 
tell application "Mail"
	tell every account whose account type is pop 
		return name
	end tell
end tell
EOD
)
arrName=($(echo "$names" | sed 's/ /-/g' | sed 's/\,-/ /g'))

for index in "${!arrName[@]}"; do
#	echo "${arrName[index]} : ${paths[index]}"
	rsync -auhP --exclude="Deleted*.mbox" "${paths[index]}/" "/Volumes/Public/Filippo/dotfiles_backup/Mail_prova/${arrName[index]}/"
done
#for path in $paths; do
#	rsync -auhP --exclude="Deleted*.mbox" "$path/" "/Volumes/Public/Filippo/dotfiles_backup/Mail_prova/${}"
#done 
