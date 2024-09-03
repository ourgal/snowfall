(let [fs (require :gears.filesystem)
      dir (fs.get_configuration_dir)]
  {:browser "firefox "
   :dnd_status false
   :fallback_password :1234
   :file_manager "thunar "
   :icon_theme_path :/.icons/Papirus/32x32/apps/
   :image_path (.. dir :popups/control_center/assets/Untitled.png)
   :name (os.getenv :USER)
   :terminal :wezterm
   :wallpaper (.. dir :Wallpapers/catMachup.jpg)})
