local M = {}

-- Linter for Vimscript.
-- Filetypes: { "vim" }
-- Method: diagnostics
-- Command: vint
-- Args: { "--style-problem", "--json", "$FILENAME" }
M.diagnostics = {
  active = false,
  opts = {},
}

return M
