local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local settings = require("settings")
local keys = require((... .. "/keys"))
local buttons = require((... .. "/buttons"))
local join = gears.table.join
local bind_key
local function _1_(_241)
  local s = settings.mappings.client.keys[_241]
  if s.enable == true then
    return keys[_241](s.modkey, s.key)
  else
    return nil
  end
end
bind_key = _1_
local bind_button
local function _3_(_241)
  local s = settings.mappings.client.buttons[_241]
  if s.enable == true then
    return buttons[_241](s.modkey, s.button)
  else
    return nil
  end
end
bind_button = _3_
local clientkeys = join(
  bind_key("fullscreen"),
  bind_key("floating"),
  bind_key("master"),
  bind_key("move_to_screen"),
  bind_key("on_top"),
  bind_key("minimize"),
  bind_key("maximize"),
  bind_key("maximize_vertical"),
  bind_key("maximize_horizontal"),
  bind_key("close")
)
local clientbuttons = join(bind_button("focus"), bind_button("move"), bind_button("resize"))
awful.rules.rules = {
  {
    properties = {
      border_color = beautiful.border_normal,
      border_width = beautiful.border_width,
      buttons = clientbuttons,
      focus = awful.client.focus.filter,
      keys = clientkeys,
      placement = (awful.placement.no_overlap + awful.placement.no_offscreen),
      raise = true,
      screen = awful.screen.preferred,
    },
    rule = {},
  },
  {
    properties = { floating = true },
    rule_any = {
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin",
        "Sxiv",
        "Tor Browser",
        "Wpa_gui",
        "veromix",
        "xtightvncviewer",
      },
      instance = { "DTA", "copyq", "pinentry" },
      name = { "Event Tester" },
      role = { "AlarmWindow", "ConfigManager", "pop-up" },
    },
  },
  { properties = { titlebars_enabled = true }, rule_any = { type = { "normal", "dialog" } } },
}
return nil
