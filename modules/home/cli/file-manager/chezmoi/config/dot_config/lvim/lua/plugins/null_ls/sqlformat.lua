local M = {}

-- The sqlformat command-line tool can reformat SQL files according to specified options.
-- Filetypes: { "sql" }
-- Method: formatting
-- Command: sqlformat
-- Args: { "-" }
M.formatting = {
  active = false,
  opts = {},
}
return M
