return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters = {
      injected = { options = { ignore_errors = true } },
      ruff_fix = {
        prepend_args = { "--extend-select", "I" },
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "ruff_fix", "ruff_format" },
      markdown = { "mdformat", "autocorrect" },
      text = { "autocorrect" },
      fish = { "fish_indent" },
      html = { "perttier" },
      sh = { "shfmt" },
      yaml = { "yamlfmt" },
      json = { "fixjson" },
      nix = { "nixfmt" },
      zig = { "zigfmt" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 5000,
      lsp_fallback = true,
    },
  },
  enabled = lvim.user_plugins.edit.format.conform,
}
