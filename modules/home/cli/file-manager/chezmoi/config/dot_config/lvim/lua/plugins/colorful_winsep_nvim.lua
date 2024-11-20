return {
  "nvim-zh/colorful-winsep.nvim",
  event = { "WinNew" },
  opts = {
    create_event = function()
      local win_n = require("colorful-winsep.utils").calculate_number_windows()
      if win_n == 2 then
        require("colorful-winsep").NvimSeparatorDel()
      end
    end,
  },
  enabled = lvim.user_plugins.edit.window.border,
}
