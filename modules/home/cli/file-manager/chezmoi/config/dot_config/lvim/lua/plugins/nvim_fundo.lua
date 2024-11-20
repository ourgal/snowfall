return {
  "kevinhwang91/nvim-fundo",
  dependencies = "kevinhwang91/promise-async",
  build = function()
    require("fundo").install()
  end,
  init = function()
    vim.o.undofile = true
  end,
  config = true,
  enabled = lvim.user_plugins.edit.undo.forever,
}
