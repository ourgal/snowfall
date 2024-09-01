local awful = require("awful")
local beautiful = require("beautiful")
local signal = _G.client.connect_signal
local function _1_(c)
  if (not c.size_hints.user_position and _G.awesome.startup) and not c.size_hints.program_position then
    return awful.placement.no_offscreen(c)
  else
    return nil
  end
end
signal("manage", _1_)
local function _3_(_241)
  return _241:emit_signal("request::activate", "mouse_enter", { raise = false })
end
signal("mouse::enter", _3_)
local function _4_(_241)
  _241.border_color = beautiful.border_focus
  return nil
end
signal("focus", _4_)
local function _5_(_241)
  _241.border_color = beautiful.border_normal
  return nil
end
return signal("unfocus", _5_)
