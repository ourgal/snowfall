local M = {}

M.config = function()
  table.insert(lvim.plugins, {
    "kosayoda/nvim-lightbulb",
    dependencies = "antoinemadec/FixCursorHold.nvim",
    config = true,
    enabled = lvim.user_plugins.edit.lsp.code_action.hint,
  })
end

return M
