local M = {}

-- An opinionated Markdown formatter that can be used to enforce a consistent style in Markdown files
-- Filetypes: { "markdown" }
-- Method: formatting
-- Command: mdformat
-- Args: { "$FILENAME" }
M.formatting = {
  active = true,
  opts = {},
}
return M
