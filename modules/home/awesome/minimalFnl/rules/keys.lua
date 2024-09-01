local awful = require("awful")
local key = awful.key
local group = "client"
local function _1_(_241, _242)
  local function _2_(c)
    c.fullscreen = not c.fullscreen
    return c:raise()
  end
  return key(_241, _242, _2_, { description = "toggle fullscreen", group = group })
end
local function _3_(_241, _242)
  local function _4_(_2410)
    return _2410:kill()
  end
  return key(_241, _242, _4_, { description = "close", group = group })
end
local function _5_(_241, _242)
  return key(_241, _242, awful.client.floating.toggle, { description = "toggle floating", group = group })
end
local function _6_(_241, _242)
  local function _7_(c)
    return c:swap(awful.client.getmaster())
  end
  return key(_241, _242, _7_, { description = "move to master", group = group })
end
local function _8_(_241, _242)
  local function _9_(c)
    return c:move_to_screen()
  end
  return key(_241, _242, _9_, { description = "move to screen", group = group })
end
local function _10_(_241, _242)
  local function _11_(c)
    c.ontop = not c.ontop
    return nil
  end
  return key(_241, _242, _11_, { description = "toggle keep on top", group = group })
end
local function _12_(_241, _242)
  local function _13_(c)
    c.minimized = true
    return nil
  end
  return key(_241, _242, _13_, { description = "minimize", group = group })
end
local function _14_(_241, _242)
  local function _15_(c)
    c.maximized = not c.maximized
    return c:raise()
  end
  return key(_241, _242, _15_, { description = "(un)maximize", group = group })
end
local function _16_(_241, _242)
  local function _17_(c)
    c.maximized_vertical = not c.maximized_vertical
    return c:raise()
  end
  return key(_241, _242, _17_, { description = "(un)maximize vertically", group = group })
end
local function _18_(_241, _242)
  local function _19_(c)
    c.maximized_horizontal = not c.maximized_horizontal
    return c:raise()
  end
  return key(_241, _242, _19_, { description = "(un)maximize horizontally", group = group })
end
return {
  fullscreen = _1_,
  close = _3_,
  floating = _5_,
  master = _6_,
  move_to_screen = _8_,
  on_top = _10_,
  minimize = _12_,
  maximize = _14_,
  maximize_vertical = _16_,
  maximize_horizontal = _18_,
}
