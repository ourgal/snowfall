(let [awful (require :awful)
      key awful.key
      group :client]
  {:fullscreen #(key $1 $2 (fn [c]
                             (set c.fullscreen (not c.fullscreen))
                             (c:raise))
                     {:description "toggle fullscreen" : group})
   :close #(key $1 $2 #($1:kill) {:description :close : group})
   :floating #(key $1 $2 awful.client.floating.toggle
                   {:description "toggle floating" : group})
   :master #(key $1 $2 (fn [c] (c:swap (awful.client.getmaster)))
                 {:description "move to master" : group})
   :move_to_screen #(key $1 $2 (fn [c] (c:move_to_screen))
                         {:description "move to screen" : group})
   :on_top #(key $1 $2 (fn [c] (set c.ontop (not c.ontop)))
                 {:description "toggle keep on top" : group})
   :minimize #(key $1 $2 (fn [c] (set c.minimized true))
                   {:description :minimize : group})
   :maximize #(key $1 $2 (fn [c]
                           (set c.maximized (not c.maximized))
                           (c:raise))
                   {:description "(un)maximize" : group})
   :maximize_vertical #(key $1 $2
                            (fn [c]
                              (set c.maximized_vertical
                                   (not c.maximized_vertical))
                              (c:raise))
                            {:description "(un)maximize vertically" : group})
   :maximize_horizontal #(key $1 $2
                              (fn [c]
                                (set c.maximized_horizontal
                                     (not c.maximized_horizontal))
                                (c:raise))
                              {:description "(un)maximize horizontally"
                               : group})})
