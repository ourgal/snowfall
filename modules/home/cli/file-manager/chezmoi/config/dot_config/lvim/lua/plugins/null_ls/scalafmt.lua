local M = {}

-- Code formatter for Scala
-- Filetypes: { "scala" }
-- Method: formatting
-- Command: scalafmt
-- Args: { "--stdin" }
M.formatting = {
  active = false,
  opts = {},
}
return M
