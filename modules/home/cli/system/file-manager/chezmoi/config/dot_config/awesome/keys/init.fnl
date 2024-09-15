(local gears (require :gears))
(local settings (require :settings))
(local join gears.table.join)
(local keys (require (.. ... :/keys)))
(local bind_key #(let [s (. settings.mappings.global.keys $1)]
                   (when (= s.enable true)
                     ((. keys $1) s.modkey s.key))))

(local bind_key_loop #(let [s (. settings.mappings.global.keys $1)]
                        (when (= s.enable true)
                          ((. keys $1) s.modkey $2))))

(var globalkeys {})
(set globalkeys (join (bind_key :focus_down) (bind_key :focus_up)
                      (bind_key :focus_left) (bind_key :focus_right)
                      (bind_key :show_help) (bind_key :history_restore)
                      (bind_key :swap_next) (bind_key :swap_prev)
                      (bind_key :focus_next) (bind_key :focus_prev)
                      (bind_key :jump_urgent) (bind_key :history_prev)
                      (bind_key :open_terminal)
                      (bind_key :increase_master_client)
                      (bind_key :decrease_master_client)
                      (bind_key :increase_columns) (bind_key :decrease_columns)
                      (bind_key :next_layout) (bind_key :prev_layout)
                      (bind_key :restore_minimized) (bind_key :toggle_wibox)
                      (bind_key :app_launcher) (bind_key :toggle_player)
                      (bind_key :awesome_restart)))

(for [i 1 settings.tag_num]
  (set globalkeys
       (join globalkeys (bind_key_loop :view_tag i)
             (bind_key_loop :toggle_tag i)
             (bind_key_loop :move_focused_client_to_tag i)
             (bind_key_loop :toggle_focused_client_to_tag i))))

(_G.root.keys globalkeys)
