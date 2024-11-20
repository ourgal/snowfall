return {
  "yamatsum/nvim-cursorline",
  lazy = true,
  opts = {
    cursorline = {
      enable = true,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    },
  },
  event = "BufWinEnter",
  enabled = lvim.user_plugins.edit.highlight.word.third,
}
