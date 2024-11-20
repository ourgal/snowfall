local M = {}

M.config = function()
  require("themes.tokyonight").config()
  require("themes.rose-pine").config()
  require("themes.catppuccin").config()
  require("themes.kanagawa").config()
end
return M
