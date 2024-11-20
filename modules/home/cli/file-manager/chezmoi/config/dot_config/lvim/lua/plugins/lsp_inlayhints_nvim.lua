return {
  "lvimuser/lsp-inlayhints.nvim",
  event = "LspAttach",
  -- commit = "84ca3abe8aaecbb5b30ad89e4701d4a9c821b72c",
  init = function()
    vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
    vim.api.nvim_create_autocmd("LspAttach", {
      group = "LspAttach_inlayhints",
      callback = function(args)
        if not (args.data and args.data.client_id) then
          return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)
      end,
    })
  end,
  config = true,
  keys = {
    {
      "\\I",
      function()
        require("lsp-inlayhints").toggle()
      end,
      desc = " Toggle Inlay",
    },
  },
  enabled = lvim.user_plugins.edit.lsp.hints.inlay,
}
