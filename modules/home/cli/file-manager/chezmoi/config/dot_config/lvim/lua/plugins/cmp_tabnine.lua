return {
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = "hrsh7th/nvim-cmp",
  lazy = true,
  event = "InsertEnter",
  config = function()
    local tabnine = require("cmp_tabnine.config")
    tabnine:setup({
      max_lines = 1000,
      max_num_results = 3,
      sort = true,
      -- run_on_every_keystroke = true,
      -- nippet_placeholder = "..",
      -- ignored_file_types = {
      -- 	-- default is not to ignore
      -- 	-- uncomment to ignore in lua:
      -- 	-- lua = true
      -- },
      -- show_prediction_strength = false,
    })
  end,
  enabled = lvim.user_plugins.edit.completion.cmp.tabnine,
}
