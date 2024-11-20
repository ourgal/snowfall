local M = {}

-- Pylint is a Python static code analysis tool which looks for programming errors, helps enforcing a coding standard, sniffs for code smells and offers simple refactoring suggestions.
-- Filetypes: { "python" }
-- Method: diagnostics
-- Command: pylint
-- Args: { "--from-stdin", "$FILENAME", "-f", "json" }
M.diagnostics = {
  active = false,
  opts = {},
}

return M
