local M = {}

-- yamlfmt is an extensible command line tool or library to format yaml files.
-- Filetypes: { "yaml" }
-- Method: formatting
-- Command: yamlfmt
-- Args: { "-" }
M.formatting = {
  active = true,
  opts = {},
}
return M
