local M = {}

-- A SQL linter and auto-formatter for Humans
-- Filetypes: {"sql"}
-- Method: diagnostics
M.diagnostics = {
  active = true,
  opts = { extra_args = { "--dialect", "sqlite" } },
}

M.formatting = {
  active = true,
  opts = { extra_args = { "--dialect", "sqlite" } },
}

return M
