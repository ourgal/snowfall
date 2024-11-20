return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  event = "WinEnter",
  config = function()
    function _G.qftf(info)
      local fn = vim.fn
      local items
      local ret = {}
      if info.quickfix == 1 then
        items = fn.getqflist({ id = info.id, items = 0 }).items
      else
        items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
      end
      local limit = 25
      local fname_fmt1, fname_fmt2 = "%-" .. limit .. "s", "…%." .. (limit - 1) .. "s"
      local valid_fmt, invalid_fmt = "%s |%5d:%-3d|%s %s", "%s"
      for i = info.start_idx, info.end_idx do
        local e = items[i]
        local fname = ""
        local str
        if e.valid == 1 then
          if e.bufnr > 0 then
            fname = vim.api.nvim_buf_get_name(e.bufnr)
            if fname == "" then
              fname = "[No Name]"
            else
              fname = fname:gsub("^" .. vim.env.HOME, "~")
            end
            if fn.strwidth(fname) <= limit then
              fname = fname_fmt1:format(fname)
            else
              fname = fname_fmt2:format(fname:sub(1 - limit, -1))
            end
          end
          local lnum = e.lnum > 99999 and "inf" or e.lnum
          local col = e.col > 999 and "inf" or e.col
          local qtype = e.type == "" and "" or " " .. e.type:sub(1, 1):upper()
          str = valid_fmt:format(fname, lnum, col, qtype, e.text)
        else
          str = invalid_fmt:format(e.text)
        end
        table.insert(ret, str)
      end
      return ret
    end

    vim.o.qftf = "{info -> v:lua._G.qftf(info)}"

    require("bqf").setup({
      auto_enable = true,
      magic_window = true,
      auto_resize_height = true,
      func_map = {
        split = "s",
        vsplit = "v",
        stoggleup = "M",
        stoggledown = "m",
        stogglevm = "m",
        filterr = "f",
        filter = "F",
      },
      preview = {
        auto_preview = true,
        show_title = true,
        delay_syntax = 50,
        wrap = true,
        should_preview_cb = function(bufnr)
          local ret = true
          local filename = vim.api.nvim_buf_get_name(bufnr)
          local fsize = vim.fn.getfsize(filename)
          -- file size greater than 100k can't be previewed automatically
          if fsize > 100 * 1024 then
            ret = false
          end
          return ret
        end,
      },
    })
  end,
  enabled = lvim.user_plugins.edit.quickfix,
}
