local M = {}

-- The uncompromising Python code formatter
-- Filetypes: { "python" }
-- Method: formatting
-- Command: black
-- Args: { "--stdin-filename", "$FILENAME", "--quiet", "-" }
-- fast / --safe                 If --fast given, skip temporary sanity checks. [default: --safe]
M.formatting = {
  active = false,
  opts = { extra_args = { "--fast" } },
}
return M
