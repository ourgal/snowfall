return {
  "nullishamy/autosave.nvim",
  config = function()
    local function normal_mode()
      return vim.api.nvim_get_mode()["mode"] == "n"
    end
    local filters = require("autosave.filters")
    require("autosave").setup({
      plugin = { force = true },
      filters = { -- The filters to apply, see above for all options.
        -- These filters are required for basic operation as they prevent
        -- errors related to to buffer state.
        filters.writeable,
        filters.not_empty,
        filters.modified,
        filters.custom(normal_mode),
      },
    })
  end,
  enabled = lvim.user_plugins.edit.autosave.first,
}
