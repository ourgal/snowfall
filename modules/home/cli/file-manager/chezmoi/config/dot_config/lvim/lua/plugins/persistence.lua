return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  lazy = true,
  config = true,
  -- keys = {
  -- 	{ "<leader>q", nil, desc = "󰗼 Quit" },
  -- 	{
  -- 		"<leader>qs",
  -- 		function()
  -- 			require("persistence").load()
  -- 		end,
  -- 		desc = "Restore last session for current dir",
  -- 	},
  -- 	{
  -- 		"<leader>ql",
  -- 		function()
  -- 			require("persistence").load({ last = true })
  -- 		end,
  -- 		desc = "Restore last session",
  -- 	},
  -- 	{
  -- 		"<leader>qq",
  -- 		function()
  -- 			require("persistence").stop()
  -- 		end,
  -- 		desc = "Quit without saving session",
  -- 	},
  -- },
  enabled = lvim.user_plugins.edit.session.half_auto.first,
}
