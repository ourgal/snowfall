local M = {}

-- Source code spell checker written in rust
-- Filetypes: {}
-- Method: diagnostics
-- Command: typos
-- Args: { "--format", "json", "-" }
M.diagnostics = {
  active = false,
  opts = {},
}

return M
