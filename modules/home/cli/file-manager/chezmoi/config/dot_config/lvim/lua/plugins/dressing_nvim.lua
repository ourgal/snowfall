return {
  "stevearc/dressing.nvim",
  lazy = true,
  event = "BufWinEnter",
  opts = {
    input = {
      get_config = function()
        if lvim.user_plugins.edit.misc.notification.noice then
          return { enabled = false }
        end
        if vim.api.nvim_get_option_value("filetype", { buf = 0 }) == "neo-tree" then
          return { enabled = false }
        end
      end,
    },
    select = {
      format_item_override = {
        codeaction = function(action_tuple)
          local title = action_tuple.action.title:gsub("\r\n", "\\r\\n")
          local client = vim.lsp.get_client_by_id(action_tuple.ctx.client_id)
          return string.format("%s\t[%s]", title:gsub("\n", "\\n"), client.name)
        end,
      },
    },
  },
  enabled = lvim.user_plugins.edit.misc.dressing,
}
