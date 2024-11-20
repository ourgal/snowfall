local M = {}

-- Checks commonly misspelled English words in source files.
-- Filetypes: {}
-- Method: diagnostics
-- Command: misspell
M.diagnostics = {
  active = false,
  opts = {},
}

return M
