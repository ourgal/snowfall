-- Battery widget for Awesome Window Manager
local wibox = require("wibox")
local vicious = require("vicious")

local battery = wibox.widget.textbox()
vicious.register(battery, vicious.widgets.bat, "Bat: $2", 61, "BAT1")

return function()
  return battery
end
