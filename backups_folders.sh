#!/bin/bash

# Wallpapers backup for <10.11
rsync -auhP --exclude=.* --exclude=*.madesktop "/Library/Desktop Pictures/" "/Volumes/Public/Filippo/dotfiles_backup/Wallpapers/"

# Backup massCode snippets
rsync -auhP --exclude=backups/ "$HOME/massCode/" "/Volumes/Public/Filippo/dotfiles_backup/massCode/"
