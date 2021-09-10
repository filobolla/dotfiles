# dotfiles
Dotfiles to be deployed to macOS and (to some extent) *NIX machines

## Things to implement in these dotfiles
### System
- Use dot instead of comma as decimal separator
    > Can it be done app-specific?
- Install QuickLook extensions
- Setup Widgets in sidebar
- Change BSD with GNU binaries
- add $PATH to `.bash_profile` instead of `/etc/paths`
- Set `bash` as default shell (10.15+)
- Export network positions
- Setup `brew` env variables (see `man brew`)
- Export Folder Actions and Services
- Backup security and privacy options
### Finder
- Add "Remote Connection" and "Path" buttons in Finder
- Show Library folder
- Add Finder favorites
    > See `sfltool`
- Export file associations
### Textedit
- Default mode plain text
### Mail
- Automate account setup (and mail import)
### Dock
- Add favorites apps
- (Automate launchpad app ordering and folder creations)
### Other
- Export Karabiner-Elements profile
- Setup OpenVPN connections
- Backup Brave/Chromium extension and bookmarks with [Chrome-Bookmark-Parser](https://github.com/DavidMetcalfe/Chrome-Bookmarks-Parser/)

## App to be installed manually (`installer`) or with `brew`
- Dropbox
- Matlab
- MS Office
- Teamviewer
- Tunnelblick
- Digilent Waveforms
- VirtualDJ + Hercules drivers

## TODO
- Make this install idempotent
- Make these dotfiles cross-platform (macOS and Linux)
## Thanks to
- Mathias Bynens' dotfiles and aliases https://github.com/mathiasbynens/dotfiles 
- Lars Kappert's dotfiles and `dockutil` usage https://github.com/webpro/dotfiles

