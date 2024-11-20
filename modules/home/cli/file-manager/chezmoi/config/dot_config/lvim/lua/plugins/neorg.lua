return {
  "nvim-neorg/neorg",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/.local/share/neorg",
          },
        },
      },
    },
  },
  ft = "norg",
  cmd = "Neorg",
  enabled = lvim.user_plugins.language.neorg,
}
