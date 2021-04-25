mash = {"⌘", "⌥", "⌃"}

require "apps"

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
    up = {mash, "up"},
    right = {mash, "right"},
    down = {mash, "down"},
    left = {mash, "left"},
    fullscreen = {mash, "f"}
})

hs.alert("Hammerspoon config loaded")
