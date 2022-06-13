function connectVPN()
    hs.osascript.applescriptFromFile('tunnelblick_on.applescript')
    hs.alert.show("Triggered VPN connect applescript")
end

function disConnectVPN()
    hs.osascript.applescriptFromFile('tunnelblick_off.applescript')
    hs.alert.show("Triggered VPN disconnect applescript")
end

hs.hotkey.bind(HYPER, "v", connectVPN)
hs.hotkey.bind(HYPER, "d", disConnectVPN)