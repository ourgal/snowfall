local M = {
  "b0o/incline.nvim",
  event = "VeryLazy",
  config = true,
  enabled = lvim.user_plugins.edit.winbar.incline.active,
}

if lvim.user_plugins.edit.winbar.incline.searchcount then
  M.opts = {
    ---@class InclineRenderProps
    ---@field buf number
    ---@field win number
    ---@field focused boolean
    ---@param props InclineRenderProps
    render = function(props)
      if not props.focused then
        return ""
      end

      local count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
      local contents = vim.fn.getreg("/")
      if type(contents) ~= "string" then
        return ""
      end

      if string.len(contents) ~= 0 and count.total ~= 0 then
        return {
          {
            " ? ",
            group = "dkoStatusKey",
          },
          {
            (" %s "):format(contents),
            group = "IncSearch",
          },
          {
            (" %d/%d "):format(count.current, count.total),
            group = "dkoStatusValue",
          },
        }
      end
    end,
    window = {
      margin = { horizontal = 0 },
      padding = 0,
    },
  }
elseif lvim.user_plugins.edit.winbar.incline.lsp then
  local function get_diagnostic_label(props)
    local icons = { error = "", warn = "", info = "", hint = "󰌵" }
    local label = {}

    for severity, icon in pairs(icons) do
      local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
      if n > 0 then
        table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
      end
    end
    if #label > 0 then
      table.insert(label, { "| " })
    end
    return label
  end
  local function get_git_diff(props)
    local icons = { removed = "", changed = "", added = "" }
    local labels = {}
    local signs = vim.b.gitsigns_status_dict
    if signs == nil then
      return
    end
    for name, icon in pairs(icons) do
      if tonumber(signs[name]) and signs[name] > 0 then
        table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
      end
    end
    -- if #labels > 0 then
    -- 	table.insert(labels, { "| " })
    -- end
    return labels
  end

  M.opts = {
    render = function(props)
      -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      -- local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
      -- local modified = vim.api.nvim_get_option_value("modified", { buf = props.buf }) and "bold,italic"
      -- or "bold"
      local buffer = {
        { get_diagnostic_label(props) },
        { get_git_diff(props) },
        -- { ft_icon, guifg = ft_color },
        -- { " " },
        -- { filename, gui = modified },
      }
      return buffer
    end,
  }
end

return M
