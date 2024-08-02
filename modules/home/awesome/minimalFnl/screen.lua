local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
beautiful.init((gears.filesystem.get_configuration_dir() .. "themes/default/theme.fnl"))
local settings = require("settings")
local modkey = settings.modkey
local menu = require("menu")
local mykeyboardlayout = awful.widget.keyboardlayout()
local mytextclock = wibox.widget.textclock()
local taglist_buttons
local function _1_(t)
  return t:view_only()
end
local function _2_(t)
  if _G.client.focus then
    return (_G.client.focus):move_to_tag(t)
  else
    return nil
  end
end
local function _4_(t)
  if _G.client.focus then
    return (_G.client.focus):toggle_tag(t)
  else
    return nil
  end
end
local function _6_(t)
  return awful.tag.viewnext(t.screen)
end
local function _7_(t)
  return awful.tag.viewprev(t.screen)
end
taglist_buttons = gears.table.join(
  awful.button({}, 1, _1_),
  awful.button({ modkey }, 1, _2_),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, _4_),
  awful.button({}, 4, _6_),
  awful.button({}, 5, _7_)
)
local tasklist_buttons
local function _8_(c)
  if c == _G.client.focus then
    c.minimized = true
    return nil
  else
    return c:emit_signal("request::activate", "tasklist", { raise = true })
  end
end
local function _10_()
  return awful.menu.client_list({ theme = { width = 250 } })
end
local function _11_()
  return awful.client.focus.byidx(1)
end
local function _12_()
  return awful.client.focus.byidx(-1)
end
tasklist_buttons = gears.table.join(
  awful.button({}, 1, _8_),
  awful.button({}, 3, _10_),
  awful.button({}, 4, _11_),
  awful.button({}, 5, _12_)
)
local function set_wallpaper(s)
  local wallpaper
  local function _13_()
    local w = beautiful.wallpaper
    if w then
      if type(w) == "function" then
        return w(s)
      else
        return w
      end
    else
      return nil
    end
  end
  wallpaper = _13_()
  if wallpaper then
    return gears.wallpaper.maximized(wallpaper, s, true)
  else
    return nil
  end
end
local function _17_(s)
  return awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
end
return awful.screen.connect_for_each_screen(_17_)
