return {
  "tzachar/cmp-fuzzy-buffer",
  dependencies = {
    "hrsh7th/nvim-cmp",
    {
      "tzachar/fuzzy.nvim",
      dependencies = { "romgrk/fzy-lua-native", build = "make" },
    },
  },
  event = "CmdlineEnter",
  init = function()
    local compare = require("cmp.config.compare")
    require("cmp").setup.sorting = {
      priority_weight = 2,
      comparators = {
        require("cmp_fuzzy_buffer.compare"),
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    }
  end,
  enabled = lvim.user_plugins.edit.completion.cmp.fuzzy,
}
