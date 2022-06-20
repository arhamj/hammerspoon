function toggleVPN()
    hs.osascript.applescriptFromFile('tunnelblick.applescript')
    hs.alert.show("Triggered VPN toggle applescript")
end

hs.hotkey.bind(HYPER, "v", toggleVPN)