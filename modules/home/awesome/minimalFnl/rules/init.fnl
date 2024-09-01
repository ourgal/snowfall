(local awful (require :awful))
(local gears (require :gears))
(local beautiful (require :beautiful))

(local settings (require :settings))
(let [keys (require (.. ... :/keys))
      buttons (require (.. ... :/buttons))
      join gears.table.join
      bind_key #(let [s (. settings.mappings.client.keys $1)]
                  (when (= s.enable true)
                    ((. keys $1) s.modkey s.key)))
      bind_button #(let [s (. settings.mappings.client.buttons $1)]
                     (when (= s.enable true)
                       ((. buttons $1) s.modkey s.button)))
      clientkeys (join (bind_key :fullscreen) (bind_key :floating)
                       (bind_key :master) (bind_key :move_to_screen)
                       (bind_key :on_top) (bind_key :minimize)
                       (bind_key :maximize) (bind_key :maximize_vertical)
                       (bind_key :maximize_horizontal) (bind_key :close))
      clientbuttons (join (bind_button :focus) (bind_button :move)
                          (bind_button :resize))]
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
         :rule_any {:type [:normal :dialog]}}]))
