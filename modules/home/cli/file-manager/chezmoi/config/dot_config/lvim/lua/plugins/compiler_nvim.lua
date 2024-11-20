return {
  "Zeioth/compiler.nvim",
  cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
  dependencies = { "stevearc/overseer.nvim" },
  config = true,
  keys = { { "<leader>c", "<cmd>CompilerOpen<cr>", desc = "Compiler" } },
  enabled = lvim.user_plugins.edit.compile.compiler,
}
