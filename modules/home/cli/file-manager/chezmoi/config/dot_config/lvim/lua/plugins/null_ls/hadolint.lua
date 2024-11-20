local M = {}

-- A smarter Dockerfile linter that helps you build best practice Docker images.
-- Filetypes: { "dockerfile" }
-- Method: diagnostics
-- Command: hadolint
-- Args: { "--no-fail", "--format=json", "-" }
M.diagnostics = {
  active = false,
  opts = {},
}

return M
