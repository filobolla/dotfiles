#!/bin/bash

osascript << EOD
tell application "Mail"
	set newmail to make new imap account with properties {name:"Poli", full name:"Filippo Bollarino", email addresses:"s287670@studenti.polito.it"}
end tell
