local M = {}

-- A tool to format codeblocks inside markdown and org documents.
-- Filetypes: { "markdown", "org" }
-- Method: formatting
-- Command: cbfmt
-- Args: { "--stdin-filepath", "$FILENAME", "--best-effort" }
M.formatting = {
  active = false,
  opts = {},
}

return M
