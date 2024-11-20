return {
  "lewis6991/hover.nvim",
  event = "LspAttach",
  init = function()
    lvim.lsp.buffer_mappings.normal_mode["K"] = nil
  end,
  opts = {
    init = function()
      -- Require providers
      require("hover.providers.lsp")
      -- require('hover.providers.gh')
      -- require('hover.providers.gh_user')
      -- require('hover.providers.jira')
      -- require('hover.providers.man')
      -- require("hover.providers.dictionary") -- https://api.dictionaryapi.dev
    end,
    mouse_providers = {
      "LSP",
    },
    title = false,
  },
  keys = {
    {
      "K",
      function()
        require("hover").hover()
      end,
    },
    {
      "gK",
      function()
        require("hover").hover_select()
      end,
    },
    {
      "<MouseMove>",
      function()
        require("hover").hover_mouse()
      end,
    },
  },
  enabled = lvim.user_plugins.edit.hover,
}
