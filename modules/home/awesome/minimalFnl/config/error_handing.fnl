(local naughty (require :naughty))
(if _G.awesome.startup_errors
    (naughty.notify {:preset naughty.config.presets.critical
                     :text _G.awesome.startup_errors
                     :title "Oops, there were errors during startup!"}))

(var in-error false)
(_G.awesome.connect_signal "debug::error"
                           (fn [err]
                             (if in-error nil
                                 (do
                                   (set in-error true)
                                   (naughty.notify {:preset naughty.config.presets.critical
                                                    :text (tostring err)
                                                    :title "Oops, an error happened!"})
                                   (set in-error false)))))
