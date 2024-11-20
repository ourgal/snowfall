return {
  "gbprod/cutlass.nvim",
  opts = { cut_key = "<A-x>", exclude = { "s<space>" } },
  keys = {
    { "d", mode = { "n", "v" } },
    { "D", mode = { "n", "v" } },
    { "c", mode = { "n", "v" } },
    { "C", mode = { "n", "v" } },
    { "x", mode = { "n", "v" } },
  },
  enabled = lvim.user_plugins.edit.nocopy,
}
