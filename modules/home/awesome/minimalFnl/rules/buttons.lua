local awful = require("awful")
local button = awful.button
local raise = true
local function _1_(_241, _242)
  local function _2_(c)
    return c:emit_signal("request::activate", "mouse_click", { raise = raise })
  end
  return button(_241, _242, _2_)
end
local function _3_(_241, _242)
  local function _4_(c)
    c:emit_signal("request::activate", "mouse_click", { raise = raise })
    return awful.mouse.client.move(c)
  end
  return button(_241, _242, _4_)
end
local function _5_(_241, _242)
  local function _6_(c)
    c:emit_signal("request::activate", "mouse_click", { raise = raise })
    return awful.mouse.client.resize(c)
  end
  return button(_241, _242, _6_)
end
return { focus = _1_, move = _3_, resize = _5_ }
