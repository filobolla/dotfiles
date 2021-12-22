#!/bin/bash

# If Public folder isnot mounted, grab password and 
if test ! -d "/Volumes/Public" ; then
pw=$(security 2>&1 >/dev/null find-internet-password -a filippo -l "CasaBolla-NAS" -g | cut -d'"' -f2)

open -g 'smb://filippo:'"${pw}"'@casabolla-nas/Public'
# unset variable to avoid pw leaks
unset pw

sleep 2
fi

# If folder continues to be missing, abort
if test ! -d "/Volumes/Public" ; then
	echo "Public folder continues to be missing, aborting backup..."
	exit 1
else
# Backup massCode snippets
echo -e "Backup massCode snippets... \n"
rsync -auhP --exclude=backups/ --exclude=".DS_Store" "$HOME/massCode/" "/Volumes/Public/Filippo/dotfiles_backup/massCode/" --delete

# Backup Cyberduck bookmarks
echo -e "Backup Cyberduck favorites... \n"
rsync -auhP --exclude=".DS_Store" "${HOME}/Library/Group Containers/G69SCX94XU.duck/Library/Application Support/duck/Bookmarks/" "/Volumes/Public/Filippo/dotfiles_backup/Cyberduck/Bookmarks" --delete
fi

osascript -e 'display notification "Backup is completed" with title "Important folders Backup"'
