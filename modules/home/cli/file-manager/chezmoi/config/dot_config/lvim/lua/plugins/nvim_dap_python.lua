return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  event = { "BufRead", "BufNew" },
  config = function()
    local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
    require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
    require("dap-python").test_runner = "pytest"
  end,
  enabled = lvim.user_plugins.language.python.debug,
}
