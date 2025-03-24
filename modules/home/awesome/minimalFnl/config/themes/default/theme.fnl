(let [xresources (require :beautiful.xresources)
      dpi xresources.apply_dpi
      bg_normal "#222222"]
  {:font :monospace
   : bg_normal
   :bg_focus "#535d6c"
   :bg_urgent "#ff0000"
   :bg_minimize "#444444"
   :bg_systray bg_normal
   :fg_normal "#aaaaaa"
   :fg_focus "#ffffff"
   :fg_urgent "#ffffff"
   :fg_minimize "#ffffff"
   :useless_gap (dpi 0)
   :border_width (dpi 1)
   :border_normal "#000000"
   :border_focus "#535d6c"
   :border_marked "#91231c"})
