return {
  "ThePrimeagen/refactoring.nvim",
  ft = { "go", "javascript", "lua", "python", "typescript", "c", "cpp", "java", "ruby" },
  event = "BufReadPost",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  config = true,
  -- TODO: set keymap
  enabled = lvim.user_plugins.edit.refactor,
}
