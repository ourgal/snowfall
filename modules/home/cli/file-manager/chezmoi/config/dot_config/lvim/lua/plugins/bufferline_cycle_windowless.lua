local M = {}

M.config = function()
  table.insert(lvim.plugins, {
    "roobert/bufferline-cycle-windowless.nvim",
    dependencies = {
      { "akinsho/bufferline.nvim" },
    },
    config = function()
      require("bufferline-cycle-windowless").setup({
        -- whether to start in enabled or disabled mode
        default_enabled = true,
      })

      lvim.builtin.which_key.mappings["|"] = { "<CMD>vsplit +enew<CR>", "Vertical split" }
      lvim.builtin.which_key.mappings["_"] = { "<CMD>split +enew<CR>", "Horizontal split" }
    end,
    keys = {
      { "L", "<CMD>BufferLineCycleWindowlessNext<CR>" },
      { "H", "<CMD>BufferLineCycleWindowlessPrev<CR>" },
    },
    enabled = lvim.user_plugins.edit.bufferline.bufferline.cycle,
  })
end

return M
