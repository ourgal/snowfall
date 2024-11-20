local M = {}

-- Scan Nix files for dead code.
-- Filetypes: { "nix" }
-- Method: diagnostics
-- Command: deadnix
-- Args: { "--output-format=json", "$FILENAME" }
-- nls.builtins.diagnostics.deadnix,
M.diagnostics = {
  active = false,
  opts = {},
}

return M
