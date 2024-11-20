return {
  "tomasky/bookmarks.nvim",
  event = "VimEnter",
  dependencies = { "nvim-telescope/telescope.nvim" },
  init = function()
    require("telescope").load_extension("bookmarks")
  end,
  config = function()
    require("bookmarks").setup({
      save_file = vim.fn.expand("$HOME/.local/share/nvim/bookmarks"), -- bookmarks save file path
      keywords = {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "🚨 ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = "📓 ", -- mark annotation startswith @n ,signs this icon as `Note`
      },
    })
  end,
  keys = {
    {
      "m'",
      function()
        require("bookmarks").bookmark_toggle()
      end,
      desc = "Bookmark Toggle",
    },
    {
      'm"',
      function()
        require("bookmarks").bookmark_ann()
      end,
      desc = "Bookmark Note",
    },
    {
      "mC",
      function()
        require("bookmarks").bookmark_clean()
      end,
      desc = "Bookmark Clean",
    },
    {
      "m>",
      function()
        require("bookmarks").bookmark_next()
      end,
      desc = "Bookmark Next",
    },
    {
      "m<",
      function()
        require("bookmarks").bookmark_prev()
      end,
      desc = "Bookmark Prev",
    },
    -- TODO conflict
    {
      "<leader>sb",
      function()
        require("telescope").extensions.bookmarks.list()
      end,
      desc = "Bookmark List",
    },
  },
  enabled = lvim.user_plugins.edit.mark.bookmarks,
}
