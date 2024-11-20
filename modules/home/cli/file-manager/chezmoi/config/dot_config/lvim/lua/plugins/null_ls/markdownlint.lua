local M = {}

-- A Node.js style checker and lint tool for Markdown/CommonMark files.
-- Filetypes: { "markdown" }
-- Method: formatting
-- Command: markdownlint
-- Args: { "--fix", "$FILENAME" }
M.formatting = {
  active = false,
  opts = {},
}

-- Markdown style and syntax checker.
-- Filetypes: { "markdown" }
-- Method: diagnostics
-- Command: markdownlint
-- Args: { "--stdin" }
M.diagnostics = {
  active = false,
  opts = {},
}
return M
