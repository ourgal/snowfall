(local M {})
(set M.terminal :wezterm)
(set M.editor (or (os.getenv :EDITOR) :vim))
(set M.editor_cmd (.. M.terminal " -e " M.editor))
(set M.modkey :Mod4)
M
