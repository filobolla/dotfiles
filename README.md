# dotfiles
Dotfiles to be deployed to macOS and (to some extent) *NIX machines

## Installation
1. Clone the repo in the home folder
``` bash
git clone https://github.com/filobolla/dotfiles.git
```
2. Run `deploy.sh` and provide sudo password

## Things to implement in these dotfiles
### System
- Use dot instead of comma as decimal separator
    > Can it be done app-specific?
- Install QuickLook extensions
- (Change BSD with GNU binaries)
- add $PATH to `.bash_profile` instead of `/etc/paths`
- Set `bash` as default shell (10.15+)
- Export network positions
- Export Folder Actions and Services
- Manage menubar items (battery,timeutil, etc.)
### Dock
- (Automate launchpad app ordering and folder creations)
### Other
- Export Karabiner-Elements profile
- Add gruvbox-dark theme to Terminal
## Things to do manually
- Import Chrome bookmarks and extensions with rsync from remote share
- Import Cyberduck bookmarks
- Import Mail folder
- Setup Finder favorites
- Setup Finder toolbar buttons "Remote connection" and "Path"
- Setup Privacy options
- Setup file associations
- Import MassCode snippets database
- Add Tunnelblick connections
- Import ssh keys
- Enable "Open terminal in folder" quick action
- Setup Widgets in sidebar
### App to be installed manually (`installer`) or with `brew` (to be added to Brewfile)
- Cinema 4D + Vray
- Dropbox
- Matlab
- MS Office+Updater (use `brew`)
- Teamviewer (problems with brew install on Catalina+)
- Tunnelblick
- Digilent Waveforms
- VirtualDJ + Hercules drivers
- Adobe CS5 or CC
- Wacom driver
- Virtualbox (otherwise change to QEMU)

## TODO
- Make this install idempotent
- Make these dotfiles cross-platform (macOS and Linux)
- Manage printer preferences with `lpadmin` and `lpoptions`

## Thanks to
- Mathias Bynens' dotfiles and aliases https://github.com/mathiasbynens/dotfiles 
- Lars Kappert's dotfiles and `dockutil` usage https://github.com/webpro/dotfiles

