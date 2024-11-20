local M = {}

-- A simple wrapper around awk to remove trailing newlines.
-- Filetypes: {}
-- Method: formatting
-- Command: awk
-- Args: { 'NF{print s $0; s=""; next} {s=s ORS}' }
M.formatting = {
  active = true,
  opts = {},
}
return M
