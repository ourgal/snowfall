return {
  "debugloop/telescope-undo.nvim",
  init = function()
    local mappings = lvim.builtin.which_key.mappings["s"]
    lvim.builtin.which_key.mappings["su"] = {}
    lvim.builtin.which_key.mappings["s"] = mappings
    require("telescope").load_extension("undo")
  end,
  keys = { { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo" } },
  enabled = lvim.user_plugins.edit.search.telescope.undo,
}
