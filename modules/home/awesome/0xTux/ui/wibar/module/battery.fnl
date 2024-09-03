(local wibox (require :wibox))
(local vicious (require :vicious))
(local settings (require :settings))
(local bat (if (= settings.host :surface) :BAT1 :BAT0))

(local battery (wibox.widget.textbox))

(vicious.register battery vicious.widgets.bat "Bat: $2" 61 bat)
#battery
