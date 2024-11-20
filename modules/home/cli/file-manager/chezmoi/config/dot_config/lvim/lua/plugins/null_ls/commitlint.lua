local M = {}

-- commitlint checks if your commit messages meet the conventional commit format.
-- Filetypes: { "gitcommit" }
-- Method: diagnostics
-- Command: commitlint
-- Args: { "--format", "commitlint-format-json" }
-- NOTE
-- Needs npm packages commitlint and a json formatter: @commitlint/{config-conventional,cli} and commitlint-format-json.
-- It works with the packages installed globally but watch out for some common issues.
M.diagnostics = {
  active = false,
  opts = {},
}

return M
