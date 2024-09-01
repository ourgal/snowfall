local awful = require("awful")
local spawn = awful.spawn
local host = os.getenv("hostname")
if host == "home" then
  spawn("wezterm", { screen = 1, tag = "1" })
  spawn("firefox", { screen = 1, tag = "2" })
  spawn("wezterm", { screen = 2, tag = "1" })
  return spawn("brave", { screen = 2, tag = "2" })
else
  return spawn("wezterm")
end
