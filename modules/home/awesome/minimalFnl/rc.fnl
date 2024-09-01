(pcall require :luarocks.loader)
(tset package.loaded :naughty.dbus {})

;; themes
(require :themes.default)

(require :awful.autofocus)
(require :awful.hotkeys_popup.keys)
(require :error_handing)
(require :layouts)
(require :screen)
(require :mouse)
(require :keys)
(require :rules)
(require :signals)
(require :autostart)
