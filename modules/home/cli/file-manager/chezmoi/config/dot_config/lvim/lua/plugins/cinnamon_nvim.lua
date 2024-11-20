return {
  "declancm/cinnamon.nvim",
  event = "BufRead",
  opts = {
    default_delay = 4,
    scroll_limit = 100,
  },
  enabled = lvim.user_plugins.edit.scroll.first,
}
