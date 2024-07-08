local M = {}
M.terminal = "wezterm"
M.editor = (os.getenv("EDITOR") or "vim")
M.editor_cmd = (M.terminal .. " -e " .. M.editor)
M.modkey = "Mod4"
return M
