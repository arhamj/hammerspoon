hs.hotkey.bind(HYPER, "0", function()
    hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
