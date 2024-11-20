return {
  "rmagatti/auto-session",
  init = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
  opts = {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    bypass_session_save_file_types = nil, -- boolean: Bypass auto save when only buffer open is one of these file types
    cwd_change_handling = { -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
      restore_upcoming_session = false, -- boolean: restore session for upcoming cwd on cwd change
      pre_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
      post_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChanged` autocmd
    },
  },
  enabled = lvim.user_plugins.edit.session.auto.second,
}
