return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    auto_update = true,
    start_delay = 3000,
    debounce_hours = 5,
  },
  enabled = lvim.user_plugins.package_manager.mason.auto.first,
}
