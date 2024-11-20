local M = {}

-- Basic linting is available for fish scripts using fish --no-execute.
-- Filetypes: { "fish" }
-- Method: diagnostics
-- Command: fish
-- Args: { "--no-execute", "$FILENAME" }
M.diagnostics = {
  active = true,
  opts = {},
}

return M
