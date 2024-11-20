return {
  "olexsmir/gopher.nvim",
  ft = { "go", "gomod" },
  event = { "BufRead", "BufNew" },
  opts = {
    commands = {
      go = "go",
      gomodifytags = "gomodifytags",
      gotests = "gotests",
      impl = "impl",
      iferr = "iferr",
    },
  },
  enabled = lvim.user_plugins.language.go.gopher,
}
