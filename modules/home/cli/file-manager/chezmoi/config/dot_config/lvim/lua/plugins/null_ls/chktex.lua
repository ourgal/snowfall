local M = {}

-- latex semantic linter.
-- Filetypes: { "tex" }
-- Method: diagnostics
-- Command: chktex
-- Args: { "-q", "-f%l:%c:%d:%k:%n:%m\n" }
M.diagnostics = {
  active = false,
  opts = {},
}

return M
