local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
beautiful.init((gears.filesystem.get_configuration_dir() .. "themes/default/theme.fnl"))
local settings = require("settings")
local modkey = settings.modkey
local clientkeys
local function _1_(c)
  c.fullscreen = not c.fullscreen
  return c:raise()
end
local function _2_(c)
  return c:kill()
end
local function _3_(c)
  return c:swap(awful.client.getmaster())
end
local function _4_(c)
  return c:move_to_screen()
end
local function _5_(c)
  c.ontop = not c.ontop
  return nil
end
local function _6_(c)
  c.minimized = true
  return nil
end
local function _7_(c)
  c.maximized = not c.maximized
  return c:raise()
end
local function _8_(c)
  c.maximized_vertical = not c.maximized_vertical
  return c:raise()
end
local function _9_(c)
  c.maximized_horizontal = not c.maximized_horizontal
  return c:raise()
end
clientkeys = gears.table.join(awful.key({modkey}, "f", _1_, {description = "toggle fullscreen", group = "client"}), awful.key({modkey, "Shift"}, "c", _2_, {description = "close", group = "client"}), awful.key({modkey, "Control"}, "space", awful.client.floating.toggle, {description = "toggle floating", group = "client"}), awful.key({modkey, "Control"}, "Return", _3_, {description = "move to master", group = "client"}), awful.key({modkey}, "o", _4_, {description = "move to screen", group = "client"}), awful.key({modkey}, "t", _5_, {description = "toggle keep on top", group = "client"}), awful.key({modkey}, "n", _6_, {description = "minimize", group = "client"}), awful.key({modkey}, "m", _7_, {description = "(un)maximize", group = "client"}), awful.key({modkey, "Control"}, "m", _8_, {description = "(un)maximize vertically", group = "client"}), awful.key({modkey, "Shift"}, "m", _9_, {description = "(un)maximize horizontally", group = "client"}))
local clientbuttons
local function _10_(c)
  return c:emit_signal("request::activate", "mouse_click", {raise = true})
end
local function _11_(c)
  c:emit_signal("request::activate", "mouse_click", {raise = true})
  return awful.mouse.client.move(c)
end
local function _12_(c)
  c:emit_signal("request::activate", "mouse_click", {raise = true})
  return awful.mouse.client.resize(c)
end
clientbuttons = gears.table.join(awful.button({}, 1, _10_), awful.button({modkey}, 1, _11_), awful.button({modkey}, 3, _12_))
awful.rules.rules = {{properties = {border_color = beautiful.border_normal, border_width = beautiful.border_width, buttons = clientbuttons, focus = awful.client.focus.filter, keys = clientkeys, placement = (awful.placement.no_overlap + awful.placement.no_offscreen), raise = true, screen = awful.screen.preferred}, rule = {}}, {properties = {floating = true}, rule_any = {class = {"Arandr", "Blueman-manager", "Gpick", "Kruler", "MessageWin", "Sxiv", "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"}, instance = {"DTA", "copyq", "pinentry"}, name = {"Event Tester"}, role = {"AlarmWindow", "ConfigManager", "pop-up"}}}, {properties = {titlebars_enabled = true}, rule_any = {type = {"normal", "dialog"}}}}
return nil
