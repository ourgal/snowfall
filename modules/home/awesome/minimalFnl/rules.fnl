(local awful (require :awful))
(local gears (require :gears))
(local beautiful (require :beautiful))

(local settings (require :settings))
(local modkey settings.modkey)
(local clientkeys
       (gears.table.join (awful.key [modkey] :f
                                    (fn [c]
                                      (set c.fullscreen (not c.fullscreen))
                                      (c:raise))
                                    {:description "toggle fullscreen"
                                     :group :client})
                         (awful.key [modkey :Shift] :c (fn [c] (c:kill))
                                    {:description :close :group :client})
                         (awful.key [modkey :Control] :space
                                    awful.client.floating.toggle
                                    {:description "toggle floating"
                                     :group :client})
                         (awful.key [modkey :Control] :Return
                                    (fn [c] (c:swap (awful.client.getmaster)))
                                    {:description "move to master"
                                     :group :client})
                         (awful.key [modkey] :o (fn [c] (c:move_to_screen))
                                    {:description "move to screen"
                                     :group :client})
                         (awful.key [modkey] :t
                                    (fn [c] (set c.ontop (not c.ontop)))
                                    {:description "toggle keep on top"
                                     :group :client})
                         (awful.key [modkey] :n (fn [c] (set c.minimized true))
                                    {:description :minimize :group :client})
                         (awful.key [modkey] :m
                                    (fn [c] (set c.maximized (not c.maximized))
                                      (c:raise))
                                    {:description "(un)maximize"
                                     :group :client})
                         (awful.key [modkey :Control] :m
                                    (fn [c]
                                      (set c.maximized_vertical
                                           (not c.maximized_vertical))
                                      (c:raise))
                                    {:description "(un)maximize vertically"
                                     :group :client})
                         (awful.key [modkey :Shift] :m
                                    (fn [c]
                                      (set c.maximized_horizontal
                                           (not c.maximized_horizontal))
                                      (c:raise))
                                    {:description "(un)maximize horizontally"
                                     :group :client})))

(local clientbuttons
       (gears.table.join (awful.button {} 1
                                       (fn [c]
                                         (c:emit_signal "request::activate"
                                                        :mouse_click
                                                        {:raise true})))
                         (awful.button [modkey] 1
                                       (fn [c]
                                         (c:emit_signal "request::activate"
                                                        :mouse_click
                                                        {:raise true})
                                         (awful.mouse.client.move c)))
                         (awful.button [modkey] 3
                                       (fn [c]
                                         (c:emit_signal "request::activate"
                                                        :mouse_click
                                                        {:raise true})
                                         (awful.mouse.client.resize c)))))

(set awful.rules.rules
     [{:properties {:border_color beautiful.border_normal
                    :border_width beautiful.border_width
                    :buttons clientbuttons
                    :focus awful.client.focus.filter
                    :keys clientkeys
                    :placement (+ awful.placement.no_overlap
                                  awful.placement.no_offscreen)
                    :raise true
                    :screen awful.screen.preferred}
       :rule {}}
      {:properties {:floating true}
       :rule_any {:class [:Arandr
                          :Blueman-manager
                          :Gpick
                          :Kruler
                          :MessageWin
                          :Sxiv
                          "Tor Browser"
                          :Wpa_gui
                          :veromix
                          :xtightvncviewer]
                  :instance [:DTA :copyq :pinentry]
                  :name ["Event Tester"]
                  :role [:AlarmWindow :ConfigManager :pop-up]}}
      {:properties {:titlebars_enabled true}
       :rule_any {:type [:normal :dialog]}}])
