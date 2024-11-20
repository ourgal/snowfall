local M = {}

-- The Refactoring library based off the Refactoring book by Martin Fowler.
-- Filetypes: { "go", "javascript", "lua", "python", "typescript" }
-- Method: code_action
M.code_actions = {
  active = true,
  opts = {
    filetypes = { "go", "javascript", "lua", "python", "typescript", "c", "cpp", "java", "ruby" },
  },
}

return M
