(local awful (require :awful))
(local beautiful (require :beautiful))

(local hotkeys-popup (require :awful.hotkeys_popup))
(local menubar (require :menubar))
(local settings (require :settings))
(local M {})
(set M.myawesomemenu [[:hotkeys
                       (fn []
                         (hotkeys-popup.show_help nil (awful.screen.focused)))]
                      [:manual (.. settings.terminal " -e man awesome")]
                      ["edit config"
                       (.. settings.editor_cmd " " _G.awesome.conffile)]
                      [:restart _G.awesome.restart]
                      [:quit (fn [] (_G.awesome.quit))]])

(set M.mymainmenu
     (awful.menu {:items [[:awesome M.myawesomemenu beautiful.awesome_icon]
                          ["open terminal" settings.terminal]]}))

(set M.mylauncher
     (awful.widget.launcher {:image beautiful.awesome_icon :menu M.mymainmenu}))

(set menubar.utils.terminal settings.terminal)
M
