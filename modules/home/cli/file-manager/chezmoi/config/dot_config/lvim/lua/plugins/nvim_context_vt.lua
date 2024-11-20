return {
  "haringsrob/nvim_context_vt",
  opts = {
    custom_parser = function(node, ft, opts)
      local utils = require("nvim_context_vt.utils")

      local start_row, _, end_row, _ = node:range()
      if end_row - start_row < 15 then
        return nil
      end

      return opts.prefix .. " " .. utils.get_node_text(node)[1]
    end,
  },
  config = true,
  enabled = lvim.user_plugins.edit.treesitter.context_match,
}
