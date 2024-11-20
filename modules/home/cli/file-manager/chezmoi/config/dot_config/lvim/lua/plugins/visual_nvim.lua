return {
  "00sapo/visual.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    lvim.builtin.treesitter.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gn",
        node_incremental = "|",
        scope_incremental = ";",
        node_decremental = '"',
      },
    }
  end,
  enabled = lvim.user_plugins.edit.treesitter.kakoune,
}
