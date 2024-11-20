return {
  "leoluz/nvim-dap-go",
  ft = { "go", "gomod" },
  event = { "BufRead", "BufNew" },
  config = true,
  enabled = lvim.user_plugins.language.go.debug,
}
