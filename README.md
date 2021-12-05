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
5. Setup Mail accounts with `Mail.mobileconfig` profile
	> Import POP folders afterwards
6. Enable remote login and remote screen to access Mac headless
	> To enable Screen Access use System Preferences, otherwise look for `/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart`
``` bash
sudo systemsetup -setremotelogin on
```

## Things to implement in these dotfiles
### System
- Use dot instead of comma as decimal separator
    > Can it be done app-specific?
- Export network positions
	> See `networksetup`, prefs are stored in `/Library/Preferences/SystemConfiguration/preferences.plist`
- Export printer preferences
	> See `lp`,`lpadmin`,`lpoptions` and CUPS-related software
- Export Folder Actions and Services
- Manage menubar items (see `com.apple.systemuiserver)
	> For Big Sur see `com.apple.controlcenter`
- Set trackpad preferences (disables force touch)
	> see `com.apple.AppleMultitouchTrackpad`
- Clone _syscripts_ repo to add script utilities
- Add git aliases
- Remove `com.apple.quarantine` with `xattr`
	> Remove from `defaults.sh` the relative line  
	Search for post-install scripts for Homebrew
- Redo Homebrew env variables
	> Set `brew update` time interval to 2 weeks
- (Change BSD with GNU binaries)
- (Change launchpad grid if screen is bigger)
- (Automate launchpad app ordering and folder creations)

## Things to do manually
- Sync Brave bookmarks, settings and extensions
- Import Cyberduck bookmarks
- Import Mail folder
	> - Also needed to copy `com.apple.mail.plist` and Accounts folder  
	> - Setup with AppleScript mail accounts, then import POP mailboxes
- Setup Finder favorites
- Setup Privacy options
- Setup file associations
- Import MassCode snippets database
- Add Tunnelblick connections
	> Made procedure in `app_setup.sh`
- Import ssh keys
- Enable "Open terminal in folder" quick action
	> Only needed in <11.0
- Setup Widgets in sidebar
- Manage menubar items (battery,tmutil, etc.)
- Import desktop pictures
	> - In Big Sur+, images are in ~/Library/Application Support/com.apple.mobileassetDesktopPicture
	> - Add `Wallpapers` folder to $HOME and set hidden flag
	> - Use `wallpaper.sh` to setup slideshow

### App to be installed manually (`installer`)
- Cinema 4D + Vray
- Matlab
- Digilent Waveforms
- VirtualDJ + Hercules drivers
- Adobe CS5 or CC
	> For Adobe CC see `adobe-packager` for downloading older packges (2020 edition works on M1) and patch them with Adobe Zii (use Zii 5.3.2)
- Wacom driver

## TODO
- Make this install idempotent
	> Divide scripts into separate files and recall them in `deploy.sh`
- Make shell dotfiles cross-platform (macOS, Linux and Windows terminal)

## Thanks to
- Mathias Bynens' dotfiles and aliases https://github.com/mathiasbynens/dotfiles 
- Lars Kappert's dotfiles and `dockutil` usage https://github.com/webpro/dotfiles
- Ben Alman's dotfiles https://github.com/cowboy/dotfiles
