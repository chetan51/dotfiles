-- Scroll with mouse pointer when right click is held down
------------------------------------------------------------

local deferred = false

overrideRightMouseDown = hs.eventtap.new({ hs.eventtap.event.types.rightMouseDown }, function(e)
    --print("down"))
    deferred = true
    return true
end)

overrideRightMouseUp = hs.eventtap.new({ hs.eventtap.event.types.rightMouseUp }, function(e)
    -- print("up"))
    if (deferred) then
        overrideRightMouseDown:stop()
        overrideRightMouseUp:stop()
        hs.eventtap.rightClick(e:location())
        overrideRightMouseDown:start()
        overrideRightMouseUp:start()
        return true
    end

    return false
end)

overrideScrollWheel = hs.eventtap.new({ hs.eventtap.event.types.scrollWheel }, function(e)
    return true
end)

local oldmousepos = {}
local scrollmult = 1	-- negative multiplier makes mouse work like traditional scrollwheel
dragRightToScroll = hs.eventtap.new({ hs.eventtap.event.types.rightMouseDragged }, function(e)
    -- print("scroll");

    deferred = false

    oldmousepos = hs.mouse.getAbsolutePosition()    

    local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
    local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
    local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult},{},'pixel')
    
    -- put the mouse back
    hs.mouse.setAbsolutePosition(oldmousepos)

    return true, {scroll}
end)

-- (disabled in favor of keyboard shortcut version below)
-- overrideRightMouseDown:start()
-- overrideRightMouseUp:start()
-- dragRightToScroll:start()


-- Scroll with mouse pointer when keyboard shortcut is pressed
------------------------------------------------------------

local moveMouseToScrollRunning = false

moveMouseToScroll = hs.eventtap.new({ hs.eventtap.event.types.mouseMoved }, function(e)
    oldmousepos = hs.mouse.getAbsolutePosition()    

    local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
    local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
    local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult},{},'pixel')
    
    -- put the mouse back
    hs.mouse.setAbsolutePosition(oldmousepos)

    return true, {scroll}
end)

function toggleMoveMouseToScroll()
    return function()
        if moveMouseToScrollRunning == true then
            moveMouseToScroll:stop()
            moveMouseToScrollRunning = false
        else
            moveMouseToScroll:start()
            moveMouseToScrollRunning = true
        end
    end
end

hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'S', toggleMoveMouseToScroll())


-- Automatically reload config when this file changes
------------------------------------------------------------

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()


-- Open Ableton automatically when USB keyboard is turned on

local usbWatcher = nil

function usbDeviceCallback(data)
    if (data["productName"] == "KOMPLETE KONTROL S49 MK2" and
        data["eventType"] == "added") then
        hs.execute('open "/Applications/Ableton Live 10 Suite.app"')
    end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()
