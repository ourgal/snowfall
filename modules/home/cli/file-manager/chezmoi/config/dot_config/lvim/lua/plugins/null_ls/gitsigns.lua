local M = {}

-- Injects code actions for Git operations at the current cursor position (stage / preview / reset hunks, blame, etc.).
-- Filetypes: {}
-- Method: code_action
M.code_actions = {
  active = true,
  opts = {},
}

return M
