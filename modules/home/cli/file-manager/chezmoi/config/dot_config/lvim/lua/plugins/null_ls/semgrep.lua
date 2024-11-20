local M = {}

-- Semgrep is a fast, open-source, static analysis tool for finding bugs and enforcing code standards at editor, commit, and CI time.
-- Filetypes: { "typescript", "typescriptreact", "ruby", "python", "java", "go" }
-- Method: diagnostics
-- Command: semgrep
-- Args: { "-q", "--json", "$FILENAME" }
M.diagnostics = {
  active = false,
  opts = {
    condition = function(utils)
      return utils.root_has_file(".semgrepignore") and use_semgrep
    end,
    extra_args = { "--metrics", "off", "--exclude", "vendor", "--config", semgrep_rule_folder },
  },
}

local semgrep_rule_folder = os.getenv("HOME") .. "/.config/semgrep/semgrep-rules/"
local use_semgrep = false
if vim.fn.filereadable(semgrep_rule_folder .. "template.yaml") then
  use_semgrep = true
end

return M
