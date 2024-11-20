local M = {}

-- Formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.
-- Filetypes: { "javascript", "typescript", "javascriptreact", "typescriptreact" }
-- Method: formatting
-- Command: rome
-- Args: { "format", "--write", "$FILENAME" }
M.formatting = {
  active = false,
  opts = {},
}

return M
