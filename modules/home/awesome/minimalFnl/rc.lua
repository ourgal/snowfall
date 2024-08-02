pcall(require, "luarocks.loader")
do
end
(package.loaded)["naughty.dbus"] = {}
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("error_handing")
require("layouts")
require("screen")
require("mouse")
require("keys")
require("rules")
require("signals")
local awful = require("awful")
local spawn = awful.spawn
local run = awful.spawn.easy_async_with_shell
local autostart
local function _1_(host)
  if host == "home" then
    spawn("wezterm", { screen = 1, tag = "1" })
    spawn("firefox", { screen = 1, tag = "2" })
    spawn("wezterm", { screen = 2, tag = "1" })
    spawn("brave", { screen = 2, tag = "2" })
    spawn("crow")
  else
  end
  if host == "surface" then
    spawn("wezterm")
    return spawn("crow")
  else
    return nil
  end
end
autostart = _1_
return run("uname -n", autostart)
