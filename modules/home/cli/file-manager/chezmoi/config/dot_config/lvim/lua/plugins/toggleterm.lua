local M = {}

M.config = function()
  -- ╭──────────────────────────────────────────────────────────╮
  -- │                          keymap                          │
  -- ╰──────────────────────────────────────────────────────────╯
  if lvim.builtin.terminal.active then
    lvim.builtin.terminal.execs = {
      { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
      { nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
      { nil, "<c-t>", "Float Terminal", "float", nil },
    }
  end
end
return M
