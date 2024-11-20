return {
  "stevearc/resession.nvim",
  lazy = false,
  dependencies = {
    {
      "tiagovla/scope.nvim",
      lazy = false,
      config = true,
    },
  },
  opts = {
    -- override default filter
    buf_filter = function(bufnr)
      local buftype = vim.bo[bufnr].buftype
      if buftype == "help" then
        return true
      end
      if buftype ~= "" and buftype ~= "acwrite" then
        return false
      end
      if vim.api.nvim_buf_get_name(bufnr) == "" then
        return false
      end

      -- this is required, since the default filter skips nobuflisted buffers
      return true
    end,
    extensions = { scope = {} }, -- add scope.nvim extension
  },
  enabled = lvim.user_plugins.edit.session.half_auto.second,
}
