do
  local awful = require("awful")
  local gears = require("gears")
  local wibox = require("wibox")
  local settings = require("settings")
  local random_files =
    gears.filesystem.get_random_file_from_dir(settings.wallpapers.dir, { ".jpg", ".png", ".svg" }, true)
  local enable = settings.wallpapers.enable
  local set_wallpaper
  local function _1_(s)
    return awful.wallpaper({
      bg = "#0000ff",
      screen = s,
      widget = {
        image = random_files,
        horizontal_fit_policy = "fit",
        vertical_fit_policy = "fit",
        resize = true,
        widget = wibox.widget.imagebox,
      },
    })
  end
  set_wallpaper = _1_
  if enable then
    local function _2_(_241)
      return set_wallpaper(_241)
    end
    _G.screen.connect_signal("request::wallpaper", _2_)
  else
  end
end
local gears = require("gears")
local settings = require("settings")
local timeout = settings.wallpapers.time
local enable = settings.wallpapers.enable
if enable then
  local function _4_()
    for s in _G.screen do
      s:emit_signal("request::wallpaper")
    end
    return nil
  end
  return gears.timer({ autostart = true, callback = _4_, timeout = timeout })
else
  return nil
end
