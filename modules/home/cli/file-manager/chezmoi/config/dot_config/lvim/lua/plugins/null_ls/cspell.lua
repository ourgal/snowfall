local M = {}

-- Injects actions to fix typos found by cspell.
-- Filetypes: {}
-- Method: code_action
M.code_actions = {
  active = false,
  opts = {},
}

-- cspell is a spell checker for code.
-- Filetypes: {}
-- Method: diagnostics
-- Command: cspell
-- Args: dynamically resolved (see source)
M.diagnostics = {
  active = false,
  opts = {},
}

return M
