local M = {}

-- Syntax-aware linter for prose built with speed and extensibility in mind.
-- Filetypes: { "markdown", "tex", "asciidoc" }
-- Method: diagnostics
-- Command: vale
-- Args: dynamically resolved (see source)
M.diagnostics = {
  active = false,
  opts = {},
}

return M
