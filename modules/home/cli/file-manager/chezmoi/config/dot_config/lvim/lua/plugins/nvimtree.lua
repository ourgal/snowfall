local M = {}

local kind = require("configs.lsp_kind")

M.config = function()
  if not lvim.builtin.nvimtree.active then
    lvim.builtin.which_key.mappings["e"] = {}
    return
  end
  -- NvimTree
  -- =========================================
  lvim.builtin.nvimtree.setup.view.side = "left"
  lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = kind.icons.hint,
      info = kind.icons.info,
      warning = kind.icons.warn,
      error = kind.icons.error,
    },
  }
  lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
  -- ╭──────────────────────────────────────────────────────────╮
  -- │                          keymap                          │
  -- ╰──────────────────────────────────────────────────────────╯
  lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "󰀶 Explorer" }
end

return M
