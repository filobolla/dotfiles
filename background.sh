#!/bin/bash

# This script applies desktop slideshow to every MONITOR (not Space!)
# To have the same setting applied to every space, setup first space and add more of them afterwards

osascript << EOF
tell application "System Events"
	(* Count active desktops *)
	set allDesktops to count of desktops 

	(* Apply background settings to every desktop *)	
	repeat with desktopNum from 1 to allDesktops
		get desktopNum
		tell desktop desktopNum
			set pictures folder to "/Users/filippo/dotfiles/backgrounds"
			set picture rotation to 1 -- time interval 
			set change interval to 300 
			set random order to true
		end tell
	end repeat
end tell
EOF
