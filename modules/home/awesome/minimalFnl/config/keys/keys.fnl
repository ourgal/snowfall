(let [awful (require :awful)
      key awful.key
      hotkeys-popup (require :awful.hotkeys_popup)
      settings (require :settings)]
  {:focus_down #(key $1 $2
                     (fn []
                       (awful.client.focus.global_bydirection :down)
                       (when _G.client.focus
                         (_G.client.focus:raise)))
                     {:description "focus down" :group :client})
   :focus_up #(key $1 $2 (fn []
                           (awful.client.focus.global_bydirection :up)
                           (when _G.client.focus
                             (_G.client.focus:raise)))
                   {:description "focus up" :group :client})
   :focus_left #(key $1 $2
                     (fn []
                       (awful.client.focus.global_bydirection :left)
                       (when _G.client.focus
                         (_G.client.focus:raise)))
                     {:description "focus left" :group :client})
   :focus_right #(key $1 $2
                      (fn []
                        (awful.client.focus.global_bydirection :right)
                        (when _G.client.focus
                          (_G.client.focus:raise)))
                      {:description "focus right" :group :client})
   :show_help #(key $1 $2 hotkeys-popup.show_help
                    {:description "show help" :group :awesome})
   :history_restore #(key $1 $2 awful.tag.history.restore
                          {:description "go back" :group :tag})
   :swap_next #(key $1 $2 (fn [] (awful.client.swap.byidx 1))
                    {:description "swap with next client by index"
                     :group :client})
   :swap_prev #(key $1 $2 (fn [] (awful.client.swap.byidx (- 1)))
                    {:description "swap with previous client by index"
                     :group :client})
   :focus_next #(key $1 $2 (fn [] (awful.screen.focus_relative 1))
                     {:description "focus the next screen" :group :screen})
   :focus_prev #(key $1 $2 (fn [] (awful.screen.focus_relative (- 1)))
                     {:description "focus the previous screen" :group :screen})
   :jump_urgent #(key $1 $2 awful.client.urgent.jumpto
                      {:description "jump to urgent client" :group :client})
   :history_prev #(key $1 $2
                       (fn [] (awful.client.focus.history.previous)
                         (when _G.client.focus
                           (_G.client.focus:raise)))
                       {:description "go back" :group :client})
   :open_terminal #(key $1 $2 (fn [] (awful.spawn settings.terminal_cmd))
                        {:description "open a terminal" :group :launcher})
   :increase_master_client #(key $1 $2
                                 (fn [] (awful.tag.incnmaster 1 nil true))
                                 {:description "increase the number of master clients"
                                  :group :layout})
   :decrease_master_client #(key $1 $2
                                 (fn []
                                   (awful.tag.incnmaster (- 1) nil true))
                                 {:description "decrease the number of master clients"
                                  :group :layout})
   :increase_columns #(key $1 $2 (fn [] (awful.tag.incncol 1 nil true))
                           {:description "increase the number of columns"
                            :group :layout})
   :decrease_columns #(key $1 $2 (fn [] (awful.tag.incncol (- 1) nil true))
                           {:description "decrease the number of columns"
                            :group :layout})
   :next_layout #(key $1 $2 (fn [] (awful.layout.inc 1))
                      {:description "select next" :group :layout})
   :prev_layout #(key $1 $2 (fn [] (awful.layout.inc (- 1)))
                      {:description "select previous" :group :layout})
   :restore_minimized #(key $1 $2
                            (fn []
                              (let [c (awful.client.restore)]
                                (when c
                                  (c:emit_signal "request::activate"
                                                 :key.unminimize {:raise true}))))
                            {:description "restore minimized" :group :client})
   :toggle_wibox #(key $1 $2
                       (fn []
                         (each [s _G.screen]
                           (set s.mywibox.visible (not s.mywibox.visible))
                           (when s.mybottomwibox
                             (set s.mybottomwibox.visible
                                  (not s.mybottomwibox.visible)))))
                       {:description "toggle wibox" :group :awesome})
   :app_launcher #(key $1 $2 (fn [] (os.execute settings.launcher_cmd))
                       {:description (.. :run settings.launcher)
                        :group :launcher})
   :toggle_player #(key $1 $2 (fn [] (os.execute settings.playerctl_cmd))
                        {:description "Player Play/Pause" :group :launcher})
   :awesome_restart #(key $1 $2 _G.awesome.restart
                          {:description "Restart Awesome" :group :awesome})
   :view_tag #(key $1 (->> $2 (+ 9) (.. "#"))
                   (fn []
                     (let [screen (awful.screen.focused)
                           tag (. screen.tags $2)]
                       (when tag (tag:view_only))))
                   {:description (.. "view tag #" $2) :group :tag})
   :toggle_tag #(key $1 (->> $2 (+ 9) (.. "#"))
                     (fn []
                       (let [screen (awful.screen.focused)
                             tag (. screen.tags $2)]
                         (when tag (awful.tag.viewtoggle tag))))
                     {:description (.. "toggle tag #" $2) :group :tag})
   :move_focused_client_to_tag #(key $1 (->> $2 (+ 9) (.. "#"))
                                     (fn []
                                       (when _G.client.focus
                                         (local tag
                                                (. _G.client.focus.screen.tags
                                                   $2))
                                         (when tag
                                           (_G.client.focus:move_to_tag tag))))
                                     {:description (.. "move focused client to tag #"
                                                       $2)
                                      :group :tag})
   :toggle_focused_client_to_tag #(key $1 (->> $2 (+ 9) (.. "#"))
                                       (fn []
                                         (when _G.client.focus
                                           (local tag
                                                  (. _G.client.focus.screen.tags
                                                     $2))
                                           (when tag
                                             (_G.client.focus:toggle_tag tag))))
                                       {:description (.. "toggle focused client on tag #"
                                                         $2)
                                        :group :tag})})
