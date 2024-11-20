local M = {}

-- An anti-bikeshedding Kotlin linter with built-in formatter.
-- Filetypes: { "kotlin" }
-- Method: diagnostics_on_save
-- Command: ktlint
-- Args: { "--relative", "--reporter=json", "**/*.kt", "**/*.kts" }
M.diagnostics_on_save = {
  active = false,
  opts = {},
}

-- Filetypes: { "kotlin" }
-- Method: formatting
-- Command: ktlint
-- Args: { "--format", "--stdin", "**/*.kt", "**/*.kts" }
M.formatting = {
  active = false,
  opts = {},
}

return M
