local M = {}

M.config = function()
  -- local fn = vim.fn
  local luasnip = require("luasnip")
  local s, sn = luasnip.snippet, luasnip.snippet_node
  local t, i, d = luasnip.text_node, luasnip.insert_node, luasnip.dynamic_node

  -- luasnip.filetype_extend("all", { "global" })

  local function uuid()
    local id, _ = vim.fn.system("uuidgen"):gsub("\n", "")
    return id
  end

  -- local function clipboard_oneline_node()
  -- 	local clipboard, _ = fn.getreg("+"):gsub("\n", " ")
  -- 	return clipboard
  -- end
  -- local luasnip_clipboard = function()
  -- 	return sn(nil, i(1, clipboard_oneline_node()))
  -- end

  luasnip.add_snippets("all", {
    s({
      trig = "uuid",
      name = "UUID",
      dscr = "Generate a unique UUID",
    }, {
      d(1, function()
        return sn(nil, i(1, uuid()))
      end),
    }),
  })

  -- luasnip.add_snippets("markdown", {
  -- 	s({
  -- 		trig = "link",
  -- 		name = "hyperlink",
  -- 		dscr = "Hyperlink with the content in the clipboard",
  -- 	}, {
  -- 		t("["),
  -- 		i(1, "text"),
  -- 		t("]"),
  -- 		t("("),
  -- 		d(2, luasnip_clipboard),
  -- 		t(") "),
  -- 	}),
  -- })
end

return M
