(let [awful (require :awful)
      button awful.button
      raise true]
  {:focus #(button $1 $2 (fn [c]
                           (c:emit_signal "request::activate" :mouse_click
                                          {: raise})))
   :move #(button $1 $2 (fn [c]
                          (c:emit_signal "request::activate" :mouse_click
                                         {: raise})
                          (awful.mouse.client.move c)))
   :resize #(button $1 $2
                    (fn [c]
                      (c:emit_signal "request::activate" :mouse_click {: raise})
                      (awful.mouse.client.resize c)))})
