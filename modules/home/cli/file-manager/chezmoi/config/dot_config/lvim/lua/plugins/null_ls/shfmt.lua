local M = {}

-- A shell parser, formatter, and interpreter with bash support.
-- Filetypes: { "sh" }
-- Method: formatting
-- Command: shfmt
-- Args: { "-filename", "$FILENAME" }
M.formatting = {
  active = true,
  opts = {},
}
return M
