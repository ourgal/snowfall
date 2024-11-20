local M = {}

-- A pluggable and configurable code formatting platform written in Rust.
-- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "markdown", "toml", "rust", "roslyn" }
-- Method: formatting
-- Command: dprint
-- Args: { "fmt", "--stdin", "$FILENAME" }
-- you need to install dprint to use this builtin and then run dprint init to initialize it in your project directory.
M.formatting = {
  active = true,
  opts = {
    condition = function(utils)
      return utils.root_has_file({ "dprint.json" })
    end,
  },
}

return M
