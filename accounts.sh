#!/bin/bash

osascript << EOD
tell application "Mail"
	get properties of every smtp server
end tell
