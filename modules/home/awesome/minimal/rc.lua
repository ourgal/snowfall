pcall(require, "luarocks.loader")

package.loaded["naughty.dbus"] = {} -- disable naughty dunst instead

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

require("error_handing")

require("layouts")

require("screen")

require("mouse")

require("keys")

require("rules")

require("signals")
