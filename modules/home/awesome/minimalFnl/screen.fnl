(local awful (require :awful))
(local wibox (require :wibox))
(local gears (require :gears))
(local beautiful (require :beautiful))

(local settings (require :settings))
(local modkey settings.modkey)
(local menu (require :menu))
(local mykeyboardlayout (awful.widget.keyboardlayout))
(local mytextclock (wibox.widget.textclock))
(local taglist-buttons
       (gears.table.join (awful.button {} 1 (fn [t] (t:view_only)))
                         (awful.button [modkey] 1
                                       (fn [t]
                                         (when _G.client.focus
                                           (_G.client.focus:move_to_tag t))))
                         (awful.button {} 3 awful.tag.viewtoggle)
                         (awful.button [modkey] 3
                                       (fn [t]
                                         (when _G.client.focus
                                           (_G.client.focus:toggle_tag t))))
                         (awful.button {} 4
                                       (fn [t] (awful.tag.viewnext t.screen)))
                         (awful.button {} 5
                                       (fn [t] (awful.tag.viewprev t.screen)))))

(local tasklist-buttons
       (gears.table.join (awful.button {} 1
                                       (fn [c]
                                         (if (= c _G.client.focus)
                                             (set c.minimized true)
                                             (c:emit_signal "request::activate"
                                                            :tasklist
                                                            {:raise true}))))
                         (awful.button {} 3
                                       (fn []
                                         (awful.menu.client_list {:theme {:width 250}})))
                         (awful.button {} 4
                                       (fn [] (awful.client.focus.byidx 1)))
                         (awful.button {} 5
                                       (fn [] (awful.client.focus.byidx (- 1))))))

(fn set-wallpaper [s]
  (let [wallpaper ((fn []
                     (let [w beautiful.wallpaper]
                       (if w
                           (if (= (type w) :function)
                               (w s)
                               w)))))]
    (when wallpaper
      (gears.wallpaper.maximized wallpaper s true))))

; (_G.screen.connect_signal "property::geometry" set-wallpaper)
(awful.screen.connect_for_each_screen (fn [s] ; (set-wallpaper s)
                                        (awful.tag [:1 :2 :3 :4 :5 :6 :7 :8 :9]
                                                   s (. awful.layout.layouts 1))))
