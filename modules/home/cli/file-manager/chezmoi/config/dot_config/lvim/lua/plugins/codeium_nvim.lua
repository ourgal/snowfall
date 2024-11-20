return {
  "jcdickinson/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    { "jcdickinson/http.nvim", build = "cargo build --workspace --release" },
  },
  config = true,
  enabled = lvim.user_plugins.edit.completion.cmp.codeium,
}
