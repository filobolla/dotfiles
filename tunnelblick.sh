#!/bin/bash

TUNNELBLICK_FOLDER="/Users/filippo/Library/Application Support/Tunnelblick/Configurations"
if test -d "$TUNNELBLICK_FOLDER"; then
        mkdir -p "$TUNNELBLICK_FOLDER"
fi
mkdir -p "${TUNNELBLICK_FOLDER}/Casa.tblk/Contents/Resources"
mkdir -p "${TUNNELBLICK_FOLDER}/Ufficio.tblk/Contents/Resources"
chmod -R 750 "${TUNNELBLICK_FOLDER}/"*.tblk

# Import config for Casa 
cp "/Volumes/Public/Filippo/dotfiles_backup/vpn_config/filippo.ovpn" "${TUNNELBLICK_FOLDER}/Casa.tblk/Contents/Resources/"
mv "${TUNNELBLICK_FOLDER}/Casa.tblk/Contents/Resources/filippo.ovpn" "${TUNNELBLICK_FOLDER}/Casa.tblk/Contents/Resources/config.ovpn" && chmod 740 "${TUNNELBLICK_FOLDER}/Casa.tblk/Contents/Resources/config.ovpn"
# Import config for Ufficio 
cp "/Volumes/Public/Filippo/dotfiles_backup/vpn_config/openvpn_ufficio/VPNConfig.ovpn" "${TUNNELBLICK_FOLDER}/Ufficio.tblk/Contents/Resources/"
mv "${TUNNELBLICK_FOLDER}/Ufficio.tblk/Contents/Resources/VPNConfig.ovpn" "${TUNNELBLICK_FOLDER}/Ufficio.tblk/Contents/Resources/config.ovpn" && chmod 740 "${TUNNELBLICK_FOLDER}/Ufficio.tblk/Contents/Resources/config.ovpn"
