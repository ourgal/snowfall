local M = {}

-- A JSON file fixer/formatter for humans using (relaxed) JSON5.
-- Filetypes: { "json" }
-- Method: formatting
-- Command: fixjson
M.formatting = {
  active = true,
  opts = {},
}
return M
