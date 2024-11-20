return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      lua = { "typos" },
      python = {
        "ruff",
        -- "vulture",  -- cunsume a lot cpu
        "typos",
      },
      fish = { "fish", "typos" },
      gitcommit = { "gitlint", "typos" },
      nix = { "nix" },
      bash = { "shellcheck" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
  enabled = lvim.user_plugins.edit.lsp.lint,
}
