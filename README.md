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
- Export Folder Actrions and Services
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

## App to be installed manually (`installer`) or with `brew`
- Dropbox
- Matlab
- MS Office
- Teamviewer
- Tunnelblick
- Digilent Waveforms
- VirtualDJ + Hercules drivers

## Resources
- Lars Kappert's dotfiles and MakeFile-style structure https://github.com/webpro/dotfiles/blob/master/macos/defaults.sh