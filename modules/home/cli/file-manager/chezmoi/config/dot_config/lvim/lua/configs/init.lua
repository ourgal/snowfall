local M = {}

M.config = function()
  require("configs.neovim").config()
  require("configs.lsp").config()
  require("configs.keymap").other()
  require("configs.macro").config()
end
return M
