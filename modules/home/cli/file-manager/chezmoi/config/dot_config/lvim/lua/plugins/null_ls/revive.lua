local M = {}

-- Fast, configurable, extensible, flexible, and beautiful linter for Go.
-- Filetypes: { "go" }
-- Method: diagnostics_on_save
-- Command: revive
-- Args: { "-formatter", "json", "./..." }
-- nls.builtins.diagnostics.revive.with({
-- }),
M.diagnostics = {
  active = false,
  opts = {
    condition = function(utils)
      return utils.root_has_file("revive.toml")
    end,
  },
}

return M
