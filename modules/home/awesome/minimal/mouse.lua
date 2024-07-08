local gears = require("gears")
local awful = require("awful")

local menu = require("menu")

-- {{{ Mouse bindings
root.buttons(gears.table.join(
  awful.button({}, 3, function()
    menu.mymainmenu:toggle()
  end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))
-- }}}
