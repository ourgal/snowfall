(local awful (require :awful))
; (local wibox (require :wibox))
(local beautiful (require :beautiful))
(local gears (require :gears))
(beautiful.init (.. (gears.filesystem.get_configuration_dir)
                    :themes/default/theme.fnl))

(_G.client.connect_signal :manage
                          (fn [c]
                            (when (and (and _G.awesome.startup
                                            (not c.size_hints.user_position))
                                       (not c.size_hints.program_position))
                              (awful.placement.no_offscreen c))))

(_G.client.connect_signal "mouse::enter"
                          (fn [c]
                            (c:emit_signal "request::activate" :mouse_enter
                                           {:raise false})))

(_G.client.connect_signal :focus
                          (fn [c] (set c.border_color beautiful.border_focus)))

(_G.client.connect_signal :unfocus
                          (fn [c] (set c.border_color beautiful.border_normal)))
