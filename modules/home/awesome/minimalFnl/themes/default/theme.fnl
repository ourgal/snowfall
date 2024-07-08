(local theme-assets (require :beautiful.theme_assets))
(local xresources (require :beautiful.xresources))
(local dpi xresources.apply_dpi)
(local gfs (require :gears.filesystem))
(local themes-path (gfs.get_themes_dir))
(local theme {})
(set theme.font "sans 8")
(set theme.bg_normal "#222222")
(set theme.bg_focus "#535d6c")
(set theme.bg_urgent "#ff0000")
(set theme.bg_minimize "#444444")
(set theme.bg_systray theme.bg_normal)
(set theme.fg_normal "#aaaaaa")
(set theme.fg_focus "#ffffff")
(set theme.fg_urgent "#ffffff")
(set theme.fg_minimize "#ffffff")
(set theme.useless_gap (dpi 0))
(set theme.border_width (dpi 1))
(set theme.border_normal "#000000")
(set theme.border_focus "#535d6c")
(set theme.border_marked "#91231c")
(local taglist-square-size (dpi 4))
(set theme.taglist_squares_sel
     (theme-assets.taglist_squares_sel taglist-square-size theme.fg_normal))
(set theme.taglist_squares_unsel
     (theme-assets.taglist_squares_unsel taglist-square-size theme.fg_normal))
(set theme.menu_submenu_icon (.. themes-path :default/submenu.png))
(set theme.menu_height (dpi 15))
(set theme.menu_width (dpi 100))
(set theme.titlebar_close_button_normal
     (.. themes-path :default/titlebar/close_normal.png))
(set theme.titlebar_close_button_focus
     (.. themes-path :default/titlebar/close_focus.png))
(set theme.titlebar_minimize_button_normal
     (.. themes-path :default/titlebar/minimize_normal.png))
(set theme.titlebar_minimize_button_focus
     (.. themes-path :default/titlebar/minimize_focus.png))
(set theme.titlebar_ontop_button_normal_inactive
     (.. themes-path :default/titlebar/ontop_normal_inactive.png))
(set theme.titlebar_ontop_button_focus_inactive
     (.. themes-path :default/titlebar/ontop_focus_inactive.png))
(set theme.titlebar_ontop_button_normal_active
     (.. themes-path :default/titlebar/ontop_normal_active.png))
(set theme.titlebar_ontop_button_focus_active
     (.. themes-path :default/titlebar/ontop_focus_active.png))
(set theme.titlebar_sticky_button_normal_inactive
     (.. themes-path :default/titlebar/sticky_normal_inactive.png))
(set theme.titlebar_sticky_button_focus_inactive
     (.. themes-path :default/titlebar/sticky_focus_inactive.png))
(set theme.titlebar_sticky_button_normal_active
     (.. themes-path :default/titlebar/sticky_normal_active.png))
(set theme.titlebar_sticky_button_focus_active
     (.. themes-path :default/titlebar/sticky_focus_active.png))
(set theme.titlebar_floating_button_normal_inactive
     (.. themes-path :default/titlebar/floating_normal_inactive.png))
(set theme.titlebar_floating_button_focus_inactive
     (.. themes-path :default/titlebar/floating_focus_inactive.png))
(set theme.titlebar_floating_button_normal_active
     (.. themes-path :default/titlebar/floating_normal_active.png))
(set theme.titlebar_floating_button_focus_active
     (.. themes-path :default/titlebar/floating_focus_active.png))
(set theme.titlebar_maximized_button_normal_inactive
     (.. themes-path :default/titlebar/maximized_normal_inactive.png))
(set theme.titlebar_maximized_button_focus_inactive
     (.. themes-path :default/titlebar/maximized_focus_inactive.png))
(set theme.titlebar_maximized_button_normal_active
     (.. themes-path :default/titlebar/maximized_normal_active.png))
(set theme.titlebar_maximized_button_focus_active
     (.. themes-path :default/titlebar/maximized_focus_active.png))
(set theme.wallpaper (.. themes-path :default/background.png))
(set theme.layout_fairh (.. themes-path :default/layouts/fairhw.png))
(set theme.layout_fairv (.. themes-path :default/layouts/fairvw.png))
(set theme.layout_floating (.. themes-path :default/layouts/floatingw.png))
(set theme.layout_magnifier (.. themes-path :default/layouts/magnifierw.png))
(set theme.layout_max (.. themes-path :default/layouts/maxw.png))
(set theme.layout_fullscreen (.. themes-path :default/layouts/fullscreenw.png))
(set theme.layout_tilebottom (.. themes-path :default/layouts/tilebottomw.png))
(set theme.layout_tileleft (.. themes-path :default/layouts/tileleftw.png))
(set theme.layout_tile (.. themes-path :default/layouts/tilew.png))
(set theme.layout_tiletop (.. themes-path :default/layouts/tiletopw.png))
(set theme.layout_spiral (.. themes-path :default/layouts/spiralw.png))
(set theme.layout_dwindle (.. themes-path :default/layouts/dwindlew.png))
(set theme.layout_cornernw (.. themes-path :default/layouts/cornernww.png))
(set theme.layout_cornerne (.. themes-path :default/layouts/cornernew.png))
(set theme.layout_cornersw (.. themes-path :default/layouts/cornersww.png))
(set theme.layout_cornerse (.. themes-path :default/layouts/cornersew.png))
(set theme.awesome_icon
     (theme-assets.awesome_icon theme.menu_height theme.bg_focus theme.fg_focus))
(set theme.icon_theme nil)
theme
