(local awful (require :awful))
(local beautiful (require :beautiful))
(local signal _G.client.connect_signal)
(signal :manage (fn [c]
                  (when (-> (not c.size_hints.user_position)
                            (and _G.awesome.startup)
                            (and (not c.size_hints.program_position)))
                    (awful.placement.no_offscreen c))))

(signal "mouse::enter" #($1:emit_signal "request::activate" :mouse_enter
                                        {:raise false}))

(signal :focus #(set $1.border_color beautiful.border_focus))

(signal :unfocus #(set $1.border_color beautiful.border_normal))
