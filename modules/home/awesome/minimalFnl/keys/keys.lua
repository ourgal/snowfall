local awful = require("awful")
local key = awful.key
local hotkeys_popup = require("awful.hotkeys_popup")
local settings = require("settings")
local function _1_(_241, _242)
  local function _2_()
    awful.client.focus.global_bydirection("down")
    if _G.client.focus then
      return (_G.client.focus):raise()
    else
      return nil
    end
  end
  return key(_241, _242, _2_, { description = "focus down", group = "client" })
end
local function _4_(_241, _242)
  local function _5_()
    awful.client.focus.global_bydirection("up")
    if _G.client.focus then
      return (_G.client.focus):raise()
    else
      return nil
    end
  end
  return key(_241, _242, _5_, { description = "focus up", group = "client" })
end
local function _7_(_241, _242)
  local function _8_()
    awful.client.focus.global_bydirection("left")
    if _G.client.focus then
      return (_G.client.focus):raise()
    else
      return nil
    end
  end
  return key(_241, _242, _8_, { description = "focus left", group = "client" })
end
local function _10_(_241, _242)
  local function _11_()
    awful.client.focus.global_bydirection("right")
    if _G.client.focus then
      return (_G.client.focus):raise()
    else
      return nil
    end
  end
  return key(_241, _242, _11_, { description = "focus right", group = "client" })
end
local function _13_(_241, _242)
  return key(_241, _242, hotkeys_popup.show_help, { description = "show help", group = "awesome" })
end
local function _14_(_241, _242)
  return key(_241, _242, awful.tag.history.restore, { description = "go back", group = "tag" })
end
local function _15_(_241, _242)
  local function _16_()
    return awful.client.swap.byidx(1)
  end
  return key(_241, _242, _16_, { description = "swap with next client by index", group = "client" })
end
local function _17_(_241, _242)
  local function _18_()
    return awful.client.swap.byidx(-1)
  end
  return key(_241, _242, _18_, { description = "swap with previous client by index", group = "client" })
end
local function _19_(_241, _242)
  local function _20_()
    return awful.screen.focus_relative(1)
  end
  return key(_241, _242, _20_, { description = "focus the next screen", group = "screen" })
end
local function _21_(_241, _242)
  local function _22_()
    return awful.screen.focus_relative(-1)
  end
  return key(_241, _242, _22_, { description = "focus the previous screen", group = "screen" })
end
local function _23_(_241, _242)
  return key(_241, _242, awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" })
end
local function _24_(_241, _242)
  local function _25_()
    awful.client.focus.history.previous()
    if _G.client.focus then
      return (_G.client.focus):raise()
    else
      return nil
    end
  end
  return key(_241, _242, _25_, { description = "go back", group = "client" })
end
local function _27_(_241, _242)
  local function _28_()
    return awful.spawn(settings.terminal)
  end
  return key(_241, _242, _28_, { description = "open a terminal", group = "launcher" })
end
local function _29_(_241, _242)
  local function _30_()
    return awful.tag.incnmaster(1, nil, true)
  end
  return key(_241, _242, _30_, { description = "increase the number of master clients", group = "layout" })
end
local function _31_(_241, _242)
  local function _32_()
    return awful.tag.incnmaster(-1, nil, true)
  end
  return key(_241, _242, _32_, { description = "decrease the number of master clients", group = "layout" })
end
local function _33_(_241, _242)
  local function _34_()
    return awful.tag.incncol(1, nil, true)
  end
  return key(_241, _242, _34_, { description = "increase the number of columns", group = "layout" })
end
local function _35_(_241, _242)
  local function _36_()
    return awful.tag.incncol(-1, nil, true)
  end
  return key(_241, _242, _36_, { description = "decrease the number of columns", group = "layout" })
end
local function _37_(_241, _242)
  local function _38_()
    return awful.layout.inc(1)
  end
  return key(_241, _242, _38_, { description = "select next", group = "layout" })
end
local function _39_(_241, _242)
  local function _40_()
    return awful.layout.inc(-1)
  end
  return key(_241, _242, _40_, { description = "select previous", group = "layout" })
end
local function _41_(_241, _242)
  local function _42_()
    local c = awful.client.restore()
    if c then
      return c:emit_signal("request::activate", "key.unminimize", { raise = true })
    else
      return nil
    end
  end
  return key(_241, _242, _42_, { description = "restore minimized", group = "client" })
end
local function _44_(_241, _242)
  local function _45_()
    for s in _G.screen do
      s.mywibox.visible = not s.mywibox.visible
      if s.mybottomwibox then
        s.mybottomwibox.visible = not s.mybottomwibox.visible
      else
      end
    end
    return nil
  end
  return key(_241, _242, _45_, { description = "toggle wibox", group = "awesome" })
end
local function _47_(_241, _242)
  local function _48_()
    return os.execute(settings.launcher_cmd)
  end
  return key(_241, _242, _48_, { description = ("run" .. settings.launcher), group = "launcher" })
end
local function _49_(_241, _242)
  local function _50_()
    return os.execute(settings.playerctl_cmd)
  end
  return key(_241, _242, _50_, { description = "Player Play/Pause", group = "launcher" })
end
local function _51_(_241, _242)
  return key(_241, _242, _G.awesome.restart, { description = "Restart Awesome", group = "awesome" })
end
local function _52_(_241, _242)
  local function _53_()
    local screen = awful.screen.focused()
    local tag = screen.tags[_242]
    if tag then
      return tag:view_only()
    else
      return nil
    end
  end
  return key(_241, ("#" .. (9 + _242)), _53_, { description = ("view tag #" .. _242), group = "tag" })
end
local function _55_(_241, _242)
  local function _56_()
    local screen = awful.screen.focused()
    local tag = screen.tags[_242]
    if tag then
      return awful.tag.viewtoggle(tag)
    else
      return nil
    end
  end
  return key(_241, ("#" .. (9 + _242)), _56_, { description = ("toggle tag #" .. _242), group = "tag" })
end
local function _58_(_241, _242)
  local function _59_()
    if _G.client.focus then
      local tag = _G.client.focus.screen.tags[_242]
      if tag then
        return (_G.client.focus):move_to_tag(tag)
      else
        return nil
      end
    else
      return nil
    end
  end
  return key(_241, ("#" .. (9 + _242)), _59_, { description = ("move focused client to tag #" .. _242), group = "tag" })
end
local function _62_(_241, _242)
  local function _63_()
    if _G.client.focus then
      local tag = _G.client.focus.screen.tags[_242]
      if tag then
        return (_G.client.focus):toggle_tag(tag)
      else
        return nil
      end
    else
      return nil
    end
  end
  return key(
    _241,
    ("#" .. (9 + _242)),
    _63_,
    { description = ("toggle focused client on tag #" .. _242), group = "tag" }
  )
end
return {
  focus_down = _1_,
  focus_up = _4_,
  focus_left = _7_,
  focus_right = _10_,
  show_help = _13_,
  history_restore = _14_,
  swap_next = _15_,
  swap_prev = _17_,
  focus_next = _19_,
  focus_prev = _21_,
  jump_urgent = _23_,
  history_prev = _24_,
  open_terminal = _27_,
  increase_master_client = _29_,
  decrease_master_client = _31_,
  increase_columns = _33_,
  decrease_columns = _35_,
  next_layout = _37_,
  prev_layout = _39_,
  restore_minimized = _41_,
  toggle_wibox = _44_,
  app_launcher = _47_,
  toggle_player = _49_,
  awesome_restart = _51_,
  view_tag = _52_,
  toggle_tag = _55_,
  move_focused_client_to_tag = _58_,
  toggle_focused_client_to_tag = _62_,
}
