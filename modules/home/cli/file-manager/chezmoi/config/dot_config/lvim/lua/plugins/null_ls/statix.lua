local M = {}

-- Lints and suggestions for the Nix programming language.
-- Filetypes: { "nix" }
-- Method: diagnostics
-- Command: statix
-- Args: { "check", "--stdin", "--format=errfmt" }
M.diagnostics = {
  active = false,
  opts = {},
}

return M
