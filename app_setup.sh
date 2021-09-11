#!/bin/sh

# Install vscode extensions
cat vs_code_extensions_list.txt | xargs -n 1 code --install-extension

# TODO:
# - Add favorites folders to Finder
# - Scripting Launchpad folder creations
# - Import Cyberduck bookmarks
# - Import Brave bookmarks
