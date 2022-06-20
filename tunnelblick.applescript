tell application "Tunnelblick"
	get state of first configuration where name = "arham_j"
	if result = "CONNECTED" then
		disconnect "arham_j"
	else
		connect "arham_j"
	end if
end tell