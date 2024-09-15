(let [awful (require :awful)
      gears (require :gears)
      wibox (require :wibox)
      settings (require :settings)
      random_files (gears.filesystem.get_random_file_from_dir settings.wallpapers.dir
                                                              [:.jpg
                                                               :.png
                                                               :.svg]
                                                              true)
      enable settings.wallpapers.enable
      set-wallpaper (fn [s]
                      (awful.wallpaper {:bg "#0000ff"
                                        :screen s
                                        :widget {:image random_files
                                                 :horizontal_fit_policy :fit
                                                 :vertical_fit_policy :fit
                                                 :resize true
                                                 :widget wibox.widget.imagebox}}))]
  (when enable
    (_G.screen.connect_signal "request::wallpaper" #(set-wallpaper $1))))

(let [gears (require :gears)
      settings (require :settings)
      timeout settings.wallpapers.time
      enable settings.wallpapers.enable]
  (when enable
    (gears.timer {:autostart true
                  :callback #(each [s _G.screen]
                               (s:emit_signal "request::wallpaper"))
                  : timeout})))
