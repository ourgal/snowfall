(local gears (require :gears))
(local hotkeys-popup (require :awful.hotkeys_popup))
(local awful (require :awful))
(local settings (require :settings))
(local modkey settings.modkey)
(var globalkeys {})
(set globalkeys
     (gears.table.join (awful.key [modkey] :j
                                  (fn []
                                    (awful.client.focus.global_bydirection :down)
                                    (when _G.client.focus (_G.client.focus:raise)))
                                  {:description "focus down" :group :client})
                       (awful.key [modkey] :k
                                  (fn []
                                    (awful.client.focus.global_bydirection :up)
                                    (when _G.client.focus (_G.client.focus:raise)))
                                  {:description "focus up" :group :client})
                       (awful.key [modkey] :h
                                  (fn []
                                    (awful.client.focus.global_bydirection :left)
                                    (when _G.client.focus (_G.client.focus:raise)))
                                  {:description "focus left" :group :client})
                       (awful.key [modkey] :l
                                  (fn []
                                    (awful.client.focus.global_bydirection :right)
                                    (when _G.client.focus (_G.client.focus:raise)))
                                  {:description "focus right" :group :client})
                       (awful.key [modkey] :s hotkeys-popup.show_help
                                  {:description "show help" :group :awesome})
                       (awful.key [modkey] :Escape awful.tag.history.restore
                                  {:description "go back" :group :tag})
                       (awful.key [modkey :Shift] :j
                                  (fn [] (awful.client.swap.byidx 1))
                                  {:description "swap with next client by index"
                                   :group :client})
                       (awful.key [modkey :Shift] :k
                                  (fn [] (awful.client.swap.byidx (- 1)))
                                  {:description "swap with previous client by index"
                                   :group :client})
                       (awful.key [modkey :Control] :j
                                  (fn [] (awful.screen.focus_relative 1))
                                  {:description "focus the next screen"
                                   :group :screen})
                       (awful.key [modkey :Control] :k
                                  (fn [] (awful.screen.focus_relative (- 1)))
                                  {:description "focus the previous screen"
                                   :group :screen})
                       (awful.key [modkey] :u awful.client.urgent.jumpto
                                  {:description "jump to urgent client"
                                   :group :client})
                       (awful.key [modkey] :Tab
                                  (fn [] (awful.client.focus.history.previous)
                                    (when _G.client.focus (_G.client.focus:raise)))
                                  {:description "go back" :group :client})
                       (awful.key [modkey] :Return
                                  (fn [] (awful.spawn settings.terminal))
                                  {:description "open a terminal"
                                   :group :launcher})
                       (awful.key [modkey :Shift] :h
                                  (fn [] (awful.tag.incnmaster 1 nil true))
                                  {:description "increase the number of master clients"
                                   :group :layout})
                       (awful.key [modkey :Shift] :l
                                  (fn [] (awful.tag.incnmaster (- 1) nil true))
                                  {:description "decrease the number of master clients"
                                   :group :layout})
                       (awful.key [modkey :Control] :h
                                  (fn [] (awful.tag.incncol 1 nil true))
                                  {:description "increase the number of columns"
                                   :group :layout})
                       (awful.key [modkey :Control] :l
                                  (fn [] (awful.tag.incncol (- 1) nil true))
                                  {:description "decrease the number of columns"
                                   :group :layout})
                       (awful.key [modkey] :space (fn [] (awful.layout.inc 1))
                                  {:description "select next" :group :layout})
                       (awful.key [modkey :Shift] :space
                                  (fn [] (awful.layout.inc (- 1)))
                                  {:description "select previous"
                                   :group :layout})
                       (awful.key [modkey :Control] :n
                                  (fn []
                                    (let [c (awful.client.restore)]
                                      (when c
                                        (c:emit_signal "request::activate"
                                                       :key.unminimize
                                                       {:raise true}))))
                                  {:description "restore minimized"
                                   :group :client})
                       (awful.key [modkey] :b
                                  (fn []
                                    (each [s _G.screen]
                                      (set s.mywibox.visible
                                           (not s.mywibox.visible))
                                      (when s.mybottomwibox
                                        (set s.mybottomwibox.visible
                                             (not s.mybottomwibox.visible)))))
                                  {:description "toggle wibox" :group :awesome})
                       (awful.key [modkey] :d
                                  (fn [] (os.execute "rofi -show drun"))
                                  {:description "run rofi" :group :launcher})
                       (awful.key [modkey] :a
                                  (fn [] (os.execute "playerctl play-pause"))
                                  {:description "Player Play/Pause"
                                   :group :launcher})))

(for [i 1 9]
  (set globalkeys
       (gears.table.join globalkeys
                         (awful.key [modkey] (.. "#" (+ i 9))
                                    (fn []
                                      (let [screen (awful.screen.focused)
                                            tag (. screen.tags i)]
                                        (when tag (tag:view_only))))
                                    {:description (.. "view tag #" i)
                                     :group :tag})
                         (awful.key [modkey :Control] (.. "#" (+ i 9))
                                    (fn []
                                      (let [screen (awful.screen.focused)
                                            tag (. screen.tags i)]
                                        (when tag (awful.tag.viewtoggle tag))))
                                    {:description (.. "toggle tag #" i)
                                     :group :tag})
                         (awful.key [modkey :Shift] (.. "#" (+ i 9))
                                    (fn []
                                      (when _G.client.focus
                                        (local tag
                                               (. _G.client.focus.screen.tags i))
                                        (when tag
                                          (_G.client.focus:move_to_tag tag))))
                                    {:description (.. "move focused client to tag #"
                                                      i)
                                     :group :tag})
                         (awful.key [modkey :Control :Shift] (.. "#" (+ i 9))
                                    (fn []
                                      (when _G.client.focus
                                        (local tag
                                               (. _G.client.focus.screen.tags i))
                                        (when tag (_G.client.focus:toggle_tag tag))))
                                    {:description (.. "toggle focused client on tag #"
                                                      i)
                                     :group :tag}))))

(_G.root.keys globalkeys)
