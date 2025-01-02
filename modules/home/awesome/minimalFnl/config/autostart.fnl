(let [awful (require :awful)
      settings (require :settings)
      spawn awful.spawn]
  (if (= settings.host :home)
      (do
        (spawn settings.terminal_cmd {:screen 1 :tag :1})
        (spawn settings.browser {:screen 1 :tag :2})
        (spawn settings.terminal_cmd {:screen 2 :tag :1})
        (spawn settings.browserS {:screen 2 :tag :2}))
      (spawn settings.terminal_cmd)))
