local M = {}

M.config = function()
  lvim.builtin.gitsigns.opts._threaded_diff = true
  lvim.builtin.gitsigns.opts._extmark_signs = true
  lvim.builtin.gitsigns.opts.current_line_blame = false
  lvim.builtin.gitsigns.opts.attach_to_untracked = false

  -- lvim.builtin.gitsigns.opts.current_line_blame_formatter = " <author>, <author_time> · <summary>"

  -- ╭──────────────────────────────────────────────────────────╮
  -- │                          keymap                          │
  -- ╰──────────────────────────────────────────────────────────╯
  lvim.builtin.which_key.mappings["gp"] = { ":Gitsigns preview_hunk<CR>", "Git Preview" }
  lvim.builtin.which_key.mappings["gs"] = { ":Gitsigns stage_hunk<CR>", "Git Stage Hunk" }
  lvim.builtin.which_key.mappings["gS"] = { ":Gitsigns stage_buffer<CR>", "Git Stage Buffer" }
  lvim.builtin.which_key.mappings["gr"] = { ":Gitsigns reset_hunk<CR>", "Git Reset Hunk" }
  lvim.builtin.which_key.mappings["gR"] = { ":Gitsigns reset_buffer<CR>", "Git Reset Buffer" }
  lvim.builtin.which_key.mappings["gu"] = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Git Undo Stage Hunk" }
  lvim.builtin.which_key.mappings["gd"] = { "<cmd>Gitsigns diffthis<CR>", "Git Diff This" }
  lvim.builtin.which_key.mappings["gt"] = { "<cmd>Gitsigns toggle_deleted<CR>", "Git Toggle Deleted" }
  lvim.builtin.which_key.mappings["gl"] = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Git Line Blame" }
end

return M
