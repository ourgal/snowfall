(let [awful (require :awful)
      spawn awful.spawn
      host (os.getenv :hostname)]
  (if (= host :home)
      (do
        (spawn :wezterm {:screen 1 :tag :1})
        (spawn :firefox {:screen 1 :tag :2})
        (spawn :wezterm {:screen 2 :tag :1})
        (spawn :brave {:screen 2 :tag :2}))
      (spawn :wezterm)))
