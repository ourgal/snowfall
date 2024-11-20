return {
  "roobert/tabtree.nvim",
  opts = {
    default_config = {
      target_query = [[
              (string) @string_capture
              (parameters) @parameters_capture
          ]],
      offsets = { string_start_capture = 1 },
    },
  },
  enabled = lvim.user_plugins.edit.treesitter.tab,
}
