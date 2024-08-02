local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require("awful")
local settings = require("settings")
local modkey = settings.modkey
local globalkeys = {}
local function _1_()
  awful.client.focus.global_bydirection("down")
  if _G.client.focus then
    return (_G.client.focus):raise()
  else
    return nil
  end
end
local function _3_()
  awful.client.focus.global_bydirection("up")
  if _G.client.focus then
    return (_G.client.focus):raise()
  else
    return nil
  end
end
local function _5_()
  awful.client.focus.global_bydirection("left")
  if _G.client.focus then
    return (_G.client.focus):raise()
  else
    return nil
  end
end
local function _7_()
  awful.client.focus.global_bydirection("right")
  if _G.client.focus then
    return (_G.client.focus):raise()
  else
    return nil
  end
end
local function _9_()
  return awful.client.swap.byidx(1)
end
local function _10_()
  return awful.client.swap.byidx(-1)
end
local function _11_()
  return awful.screen.focus_relative(1)
end
local function _12_()
  return awful.screen.focus_relative(-1)
end
local function _13_()
  awful.client.focus.history.previous()
  if _G.client.focus then
    return (_G.client.focus):raise()
  else
    return nil
  end
end
local function _15_()
  return awful.spawn(settings.terminal)
end
local function _16_()
  return awful.tag.incnmaster(1, nil, true)
end
local function _17_()
  return awful.tag.incnmaster(-1, nil, true)
end
local function _18_()
  return awful.tag.incncol(1, nil, true)
end
local function _19_()
  return awful.tag.incncol(-1, nil, true)
end
local function _20_()
  return awful.layout.inc(1)
end
local function _21_()
  return awful.layout.inc(-1)
end
local function _22_()
  local c = awful.client.restore()
  if c then
    return c:emit_signal("request::activate", "key.unminimize", { raise = true })
  else
    return nil
  end
end
local function _24_()
  for s in _G.screen do
    s.mywibox.visible = not s.mywibox.visible
    if s.mybottomwibox then
      s.mybottomwibox.visible = not s.mybottomwibox.visible
    else
    end
  end
  return nil
end
local function _26_()
  return os.execute("rofi -show drun")
end
local function _27_()
  return os.execute("playerctl play-pause")
end
globalkeys = gears.table.join(
  awful.key({ modkey }, "j", _1_, { description = "focus down", group = "client" }),
  awful.key({ modkey }, "k", _3_, { description = "focus up", group = "client" }),
  awful.key({ modkey }, "h", _5_, { description = "focus left", group = "client" }),
  awful.key({ modkey }, "l", _7_, { description = "focus right", group = "client" }),
  awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
  awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
  awful.key({ modkey, "Shift" }, "j", _9_, { description = "swap with next client by index", group = "client" }),
  awful.key({ modkey, "Shift" }, "k", _10_, { description = "swap with previous client by index", group = "client" }),
  awful.key({ modkey, "Control" }, "j", _11_, { description = "focus the next screen", group = "screen" }),
  awful.key({ modkey, "Control" }, "k", _12_, { description = "focus the previous screen", group = "screen" }),
  awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
  awful.key({ modkey }, "Tab", _13_, { description = "go back", group = "client" }),
  awful.key({ modkey }, "Return", _15_, { description = "open a terminal", group = "launcher" }),
  awful.key({ modkey, "Shift" }, "h", _16_, { description = "increase the number of master clients", group = "layout" }),
  awful.key({ modkey, "Shift" }, "l", _17_, { description = "decrease the number of master clients", group = "layout" }),
  awful.key({ modkey, "Control" }, "h", _18_, { description = "increase the number of columns", group = "layout" }),
  awful.key({ modkey, "Control" }, "l", _19_, { description = "decrease the number of columns", group = "layout" }),
  awful.key({ modkey }, "space", _20_, { description = "select next", group = "layout" }),
  awful.key({ modkey, "Shift" }, "space", _21_, { description = "select previous", group = "layout" }),
  awful.key({ modkey, "Control" }, "n", _22_, { description = "restore minimized", group = "client" }),
  awful.key({ modkey }, "b", _24_, { description = "toggle wibox", group = "awesome" }),
  awful.key({ modkey }, "d", _26_, { description = "run rofi", group = "launcher" }),
  awful.key({ modkey }, "a", _27_, { description = "Player Play/Pause", group = "launcher" })
)
for i = 1, 9 do
  local function _28_()
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
      return tag:view_only()
    else
      return nil
    end
  end
  local function _30_()
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
      return awful.tag.viewtoggle(tag)
    else
      return nil
    end
  end
  local function _32_()
    if _G.client.focus then
      local tag = _G.client.focus.screen.tags[i]
      if tag then
        return (_G.client.focus):move_to_tag(tag)
      else
        return nil
      end
    else
      return nil
    end
  end
  local function _35_()
    if _G.client.focus then
      local tag = _G.client.focus.screen.tags[i]
      if tag then
        return (_G.client.focus):toggle_tag(tag)
      else
        return nil
      end
    else
      return nil
    end
  end
  globalkeys = gears.table.join(
    globalkeys,
    awful.key({ modkey }, ("#" .. (i + 9)), _28_, { description = ("view tag #" .. i), group = "tag" }),
    awful.key({ modkey, "Control" }, ("#" .. (i + 9)), _30_, { description = ("toggle tag #" .. i), group = "tag" }),
    awful.key(
      { modkey, "Shift" },
      ("#" .. (i + 9)),
      _32_,
      { description = ("move focused client to tag #" .. i), group = "tag" }
    ),
    awful.key(
      { modkey, "Control", "Shift" },
      ("#" .. (i + 9)),
      _35_,
      { description = ("toggle focused client on tag #" .. i), group = "tag" }
    )
  )
end
return _G.root.keys(globalkeys)
