local beautiful = require("beautiful")
local gears = require("gears")
return beautiful.init((gears.filesystem.get_themes_dir() .. "default/theme.fnl"))
