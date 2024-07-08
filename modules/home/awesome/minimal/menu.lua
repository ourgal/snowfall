local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/default/theme.lua")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

local settings = require("settings")

local M = {}

-- {{{ Menu
-- Create a launcher widget and a main menu
M.myawesomemenu = {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "manual", settings.terminal .. " -e man awesome" },
  { "edit config", settings.editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  {
    "quit",
    function()
      awesome.quit()
    end,
  },
}

M.mymainmenu = awful.menu({
  items = {
    { "awesome", M.myawesomemenu, beautiful.awesome_icon },
    { "open terminal", settings.terminal },
  },
})

M.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = M.mymainmenu })

-- Menubar configuration
menubar.utils.terminal = settings.terminal -- Set the terminal for applications that require it
-- }}}

return M
