local M = {}

-- An open source project for linting Solidity code. It provides both security and style guide validations.
-- Filetypes: { "solidity" }
-- Method: diagnostics
-- Command: solhint
-- Args: { "$FILENAME", "--formatter", "unix" }
M.diagnostics = {
  active = false,
  opts = {
    condition = function(utils)
      return utils.root_has_file(".solhint.json")
    end,
  },
}

return M
