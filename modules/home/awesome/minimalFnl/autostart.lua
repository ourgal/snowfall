local awful = require("awful")
local settings = require("settings")
local spawn = awful.spawn
if settings.host == "home" then
  spawn(settings.terminal, { screen = 1, tag = "1" })
  spawn(settings.browser, { screen = 1, tag = "2" })
  spawn(settings.terminal, { screen = 2, tag = "1" })
  return spawn(settings.browserS, { screen = 2, tag = "2" })
else
  return spawn(settings.terminal)
end
