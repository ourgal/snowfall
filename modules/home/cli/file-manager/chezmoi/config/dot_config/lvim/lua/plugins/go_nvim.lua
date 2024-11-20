return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = { lsp_inlay_hints = {
    enable = not lvim.user_plugins.edit.lsp.hints.inlay,
  } },
  -- event = { "CmdlineEnter" }, -- auto enable lsp diagnostic
  ft = { "go", "gomod" },
  -- build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  enabled = lvim.user_plugins.language.go.active,
}
