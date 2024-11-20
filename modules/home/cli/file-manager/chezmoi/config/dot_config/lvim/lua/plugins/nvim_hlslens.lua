return {
  "kevinhwang91/nvim-hlslens",
  event = "BufReadPost",
  opts = { calm_down = true, nearest_only = true },
  keys = {
    {
      "n",
      "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
    },
    {
      "N",
      "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
    },
    {
      "*",
      "*<Cmd>lua require('hlslens').start()<CR>",
    },
    {
      "#",
      "#<Cmd>lua require('hlslens').start()<CR>",
    },
    {
      "g*",
      "g*<Cmd>lua require('hlslens').start()<CR>",
      desc = "search forward",
    },
    {
      "g#",
      "g#<Cmd>lua require('hlslens').start()<CR>",
      desc = "search backward",
    },
  },
  enabled = lvim.user_plugins.edit.cmd.search_highlight,
}
