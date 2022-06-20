function toggleAudioOutput()
    return function()
        local current = hs.audiodevice.defaultOutputDevice()
        local speakers = hs.audiodevice.findOutputByName('MacBook Pro Speakers')
        local realmeBuds = hs.audiodevice.findOutputByName('realme Buds Q2 TWS')

        if current:name() == speakers:name() then
            if realmeBuds ~= nil then
                realmeBuds:setDefaultOutputDevice()
            end
        else
            speakers:setDefaultOutputDevice()
        end
    end
end

hs.hotkey.bind(HYPER, "]", toggleAudioOutput())

function getCurrentOutputDevicePrefix()
    if(hs.audiodevice.defaultOutputDevice() ~= nil and hs.audiodevice.defaultOutputDevice():name() ~= nil) then
        return string.sub(hs.audiodevice.defaultOutputDevice():name(), 0, 3)
    end
end

function audioChanged()
    audioMenu:setTitle(getCurrentOutputDevicePrefix())
end

audioMenu = hs.menubar.newWithPriority(2147483646)
audioChanged()
audioMenu:setClickCallback(toggleAudioOutput())

hs.audiodevice.watcher.setCallback(audioChanged)
hs.audiodevice.watcher.start()

