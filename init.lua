alert = require 'hs.alert'
buf = {}
log = hs.logger.new('main', 'info')
HYPER = { "cmd", "alt", "ctrl", "shift" }
col = hs.drawing.color.x11
wm = hs.webview.windowMasks


hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall

Install:andUse("Keychain")

function loadKeychainPasswordByComment(comment)
    local item = spoon.Keychain:getItem { comment = comment }
    return item.password
end

function loadKeychainPasswordByAccount(account)
    local item = spoon.Keychain:getItem { account = account }
    return item.password
end

function debuglog(text)
    hs.console.printStyledtext("DEBUG: " .. tostring(text))
end

if hs.wasLoaded == nil then
    hs.wasLoaded = true
    table.insert(buf, "Hammerspoon loaded.")
else
    table.insert(buf, "Hammerspoon re-loaded.")
end

alert.show(table.concat(buf))

---init
require 'hyper_bindings'
require 'hold_to_quit'
-- require 'audio_watcher'
require 'mic_mute'
require 'ping'
require 'reload_config'
require 'tunnelblick'
require 'pomodoro'
