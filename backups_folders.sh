#!/bin/bash

# Wallpapers backup for <10.11
#rsync -auhP --exclude=.* --exclude=*.madesktop "/Library/Desktop Pictures/" "/Volumes/Public/Filippo/dotfiles_backup/Wallpapers/"

# Backup massCode snippets
echo -e "Backup massCode snippets... \n"
rsync -auhP --exclude=backups/ "$HOME/massCode/" "/Volumes/Public/Filippo/dotfiles_backup/massCode/"

echo -e "Backup Mail folders... \n"
rsync -auhP --exclude="Deleted Messages.mbox" "${HOME}/Library/Mail/" "/Volumes/Public/Filippo/dotfiles_backup/Mail/"
