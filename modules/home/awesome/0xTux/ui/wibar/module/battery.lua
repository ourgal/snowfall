local wibox = require("wibox")
local vicious = require("vicious")
local settings = require("settings")
local bat
if settings.host == "surface" then
  bat = "BAT1"
else
  bat = "BAT0"
end
local battery = wibox.widget.textbox()
vicious.register(battery, vicious.widgets.bat, "Bat: $2", 61, bat)
local function _2_()
  return battery
end
return _2_
