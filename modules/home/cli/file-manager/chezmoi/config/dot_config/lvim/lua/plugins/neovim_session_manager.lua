return {
  "Shatur/neovim-session-manager",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local config = require("session_manager.config")
    require("session_manager").setup({
      autoload_mode = config.AutoloadMode.CurrentDir, --  Disabled, CurrentDir, LastSession
      dir_to_session_filename = function()
        local Path = require("plenary.path")
        local new_dir = os.getenv("PWD")
        if new_dir == nil then
          return nil
        end
        local path_replacer = "__"
        local colon_replacer = "++"

        local filename = new_dir:gsub(":", colon_replacer)
        filename = filename:gsub(Path.path.sep, path_replacer)
        return Path:new(config.sessions_dir):joinpath(filename)
      end,
      autosave_ignore_filetypes = {
        "gitcommit",
        "gitrebase",
        "alpha",
        "lazy",
        "",
      },
    })
  end,
  enabled = lvim.user_plugins.edit.session.auto.first,
}
