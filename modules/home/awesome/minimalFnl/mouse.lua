local gears = require("gears")
local awful = require("awful")
local menu = require("menu")
local join = gears.table.join
local button = awful.button
local function _1_()
  return (menu.mymainmenu):toggle()
end
return _G.root.buttons(join(button({}, 3, _1_), button({}, 4, awful.tag.viewnext), button({}, 5, awful.tag.viewprev)))
