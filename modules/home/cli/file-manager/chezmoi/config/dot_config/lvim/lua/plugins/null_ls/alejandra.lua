local M = {}

-- The Uncompromising Nix Code Formatter
-- Filetypes: { "nix" }
-- Method: formatting
-- Command: alejandra
-- Args: { "--quiet" }
M.formatting = {
  active = false,
  opts = {},
}
return M
