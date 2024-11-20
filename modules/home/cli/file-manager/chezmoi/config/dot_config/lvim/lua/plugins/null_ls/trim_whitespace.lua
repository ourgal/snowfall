local M = {}

-- A simple wrapper around awk to remove trailing whitespace.
-- Filetypes: {}
-- Method: formatting
-- Command: awk
-- Args: { '{ sub(/[ \t]+$/, ""); print }' }
M.formatting = {
  active = true,
  opts = {},
}
return M
