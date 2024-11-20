return {
  "tommcdo/vim-exchange",
  keys = {
    { "cx", "<Plug>(Exchange)", desc = "Exchange" },
    { "X", "<Plug>(Exchange)", mode = "x", desc = "Exchange" },
    { "cxc", "<Plug>(ExchangeClear)", desc = "ExchangeClear" },
    { "cxx", "<Plug>(ExchangeLine)", desc = "ExchangeLine" },
  },
  enabled = lvim.user_plugins.edit.exchange,
}
