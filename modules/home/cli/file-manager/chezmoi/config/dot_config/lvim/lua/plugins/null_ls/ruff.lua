local M = {}

-- An extremely fast Python linter, written in Rust.
-- Filetypes: { "python" }
-- Method: diagnostics
-- Command: ruff
-- Args: { "-n", "-e", "--stdin-filename", "$FILENAME", "-" }
M.diagnostics = {
  active = true,
  opts = {
    condition = function(utils)
      return utils.root_has_file({ "ruff.toml", ".ruff.toml", "pyproject.toml" })
    end,
  },
}

-- Filetypes: { "python" }
-- Method: formatting
-- Command: ruff
-- Args: { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" }
M.formatting = {
  active = true,
  opts = {
    condition = function(utils)
      return utils.root_has_file({ "ruff.toml", ".ruff.toml", "pyproject.toml" })
    end,
    -- extra_args = {
    -- 	"--unfixable F401,F841",
    -- 	"--select A,ARG,B,C,DTZ,E,EM,F,FBT,I,ICN,ISC,N,PLC,PLE,PLR,PLW,Q,RUF,S,T,TID,UP,W,VTT",
    -- 	"--ignore B027,FBT003,S105,S106,S107,C901,PLR0911,PLR0912,PLR0913,PLR0915",
    -- },
  },
}

return M
