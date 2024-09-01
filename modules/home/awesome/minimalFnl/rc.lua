pcall(require, "luarocks.loader")
do
end
(package.loaded)["naughty.dbus"] = {}
require("themes.default")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("error_handing")
require("layouts")
require("screen")
require("mouse")
require("keys")
require("rules")
require("signals")
return require("autostart")
