local M = {}

-- A tool for formatting rust code according to style guidelines.
-- Filetypes: { "rust" }
-- Method: formatting
-- Command: rustfmt
-- Args: { "--emit=stdout" }
M.formatting = {
  active = true,
  opts = {},
}

return M
