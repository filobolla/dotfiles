# dotfiles
Dotfiles to be deployed to macOS and (to some extent) *NIX machines

## Installation
0. (Login into App Store in order to use `mas`)
	> App Store can ask for prompts (previous version of apps), needs to be sorted out
1. Run updates before configuration
``` bash 
sudo softwareupdate -i -a
```
2. Install Xcode CLI Tools
``` bash
xcode-select --install
```
3. Clone the repo in the home folder
``` bash
git clone https://github.com/filobolla/dotfiles.git
```
4. Run `deploy.sh` and provide sudo password

## Things to implement in these dotfiles
### System
- Use dot instead of comma as decimal separator
    > Can it be done app-specific?
- (Change BSD with GNU binaries)
- Export network positions
	> See `networksetup`, prefs are stored in `/Library/Preferences/SystemConfiguration/preferences.plist`
- Export printer preferences
	> See `lp`,`lpadmin`,`lpoptions` and CUPS-related software
- Export Folder Actions and Services
- Manage menubar items (see `com.apple.systemuiserver)
	> For Big Sur see `com.apple.controlcenter`
## Things to do manually
- Import Chrome bookmarks and extensions with rsync from remote share
	> Brave/Chrome must be also set as default browser
- Import Cyberduck bookmarks
- Import Mail folder
- Setup Finder favorites
- Setup Finder toolbar buttons "Remote connection" and "Path"
	> - Can be done with PlistBuddy on key `NSToolbar Configuration Browser`
	> - To enable this key we must edit the toolbar beforehand
- Setup Privacy options
- Setup file associations
- Import MassCode snippets database
- Add Tunnelblick connections
	> See AppleScript support for Tunnelblick
- Import ssh keys
- Enable "Open terminal in folder" quick action
	> Only needed in <11.0
- Setup Widgets in sidebar
- Manage menubar items (battery,tmutil, etc.)
### App to be installed manually (`installer`) or with `brew` (to be added to Brewfile)
- Cinema 4D + Vray
- Matlab
- Digilent Waveforms
- VirtualDJ + Hercules drivers
- Adobe CS5 or CC
- Wacom driver
- (Automate launchpad app ordering and folder creations)
## TODO
- Make this install idempotent
- Make these dotfiles cross-platform (macOS and Linux)

## Thanks to
- Mathias Bynens' dotfiles and aliases https://github.com/mathiasbynens/dotfiles 
- Lars Kappert's dotfiles and `dockutil` usage https://github.com/webpro/dotfiles
- Ben Alman's dotfiles https://github.com/cowboy/dotfiles
