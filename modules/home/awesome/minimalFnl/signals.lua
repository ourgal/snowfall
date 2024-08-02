local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
beautiful.init((gears.filesystem.get_configuration_dir() .. "themes/default/theme.fnl"))
local function _1_(c)
  if (_G.awesome.startup and not c.size_hints.user_position) and not c.size_hints.program_position then
    return awful.placement.no_offscreen(c)
  else
    return nil
  end
end
_G.client.connect_signal("manage", _1_)
local function _3_(c)
  return c:emit_signal("request::activate", "mouse_enter", { raise = false })
end
_G.client.connect_signal("mouse::enter", _3_)
local function _4_(c)
  c.border_color = beautiful.border_focus
  return nil
end
_G.client.connect_signal("focus", _4_)
local function _5_(c)
  c.border_color = beautiful.border_normal
  return nil
end
return _G.client.connect_signal("unfocus", _5_)
