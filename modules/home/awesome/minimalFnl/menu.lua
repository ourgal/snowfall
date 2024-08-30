local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local settings = require("settings")
local M = {}
local function _1_()
  return hotkeys_popup.show_help(nil, awful.screen.focused())
end
local function _2_()
  return _G.awesome.quit()
end
M.myawesomemenu = {
  { "hotkeys", _1_ },
  { "manual", (settings.terminal .. " -e man awesome") },
  { "edit config", (settings.editor_cmd .. " " .. _G.awesome.conffile) },
  { "restart", _G.awesome.restart },
  { "quit", _2_ },
}
M.mymainmenu = awful.menu({
  items = { { "awesome", M.myawesomemenu, beautiful.awesome_icon }, { "open terminal", settings.terminal } },
})
M.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = M.mymainmenu })
menubar.utils.terminal = settings.terminal
return M
