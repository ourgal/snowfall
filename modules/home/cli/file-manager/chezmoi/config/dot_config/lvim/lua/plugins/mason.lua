local M = {}

M.config = function()
  local kind = require("configs.lsp_kind")
  lvim.builtin.mason.ui.icons = kind.mason
end

return M
