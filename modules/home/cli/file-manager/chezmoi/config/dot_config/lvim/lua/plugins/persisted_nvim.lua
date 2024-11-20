return {
  "olimorris/persisted.nvim",
  opts = {
    silent = true,
    should_autosave = function()
      -- do not autosave if the alpha dashboard is the current filetype
      if vim.bo.filetype == "alpha" or vim.bo.filetype == "lazy" then
        return false
      end
      return true
    end,
    autoload = true,
  },
  enabled = lvim.user_plugins.edit.session.auto.fourth,
}
