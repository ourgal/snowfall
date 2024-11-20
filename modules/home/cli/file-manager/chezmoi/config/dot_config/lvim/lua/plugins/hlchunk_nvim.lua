local default_conf = {
  enable = true,
  priority = 15,
  style = {
    { fg = "#806d9c" },
    { fg = "#c21f30" },
  },
  use_treesitter = true,
  chars = {
    horizontal_line = "─",
    vertical_line = "│",
    left_top = "╭",
    left_bottom = "╰",
    right_arrow = ">",
  },
  textobject = "",
  max_file_size = 1024 * 1024,
  error_sign = true,
}
return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = { chunk = default_conf },
  enabled = lvim.user_plugins.edit.misc.hlchunk,
}
