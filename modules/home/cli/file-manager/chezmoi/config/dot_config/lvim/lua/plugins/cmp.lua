local M = {}

local kind = require("configs.lsp_kind")

M.config = function()
  -- CMP
  -- =========================================
  lvim.builtin.cmp.sources = {
    { name = "nvim_lsp" },
    { name = "luasnip", max_item_count = 3 },
    { name = "buffer", max_item_count = 5 },
    {
      name = "rg",
      max_item_count = 3,
      keyword_length = 3,
      option = {
        debounce = 500,
        additional_arguments = "--max-depth 6 --one-file-system --ignore-file ~/.config/lvim/ignore.rg",
      },
    },
    { name = "path", max_item_count = 5 },
    { name = "cmp_tabnine", max_item_count = 3 },
    { name = "codeium", max_item_count = 3 },
    { name = "nvim_lua" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "nvim_lsp_signature_help" },
    { name = "natdat" },
    -- { name = "latex_symbols" },
    -- { name = "crates" },
    -- { name = "orgmode" },
  }

  -- TODO: ghost_text not working
  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  -- lvim.builtin.cmp.completion.completeopt = table.concat(vim.opt.completeopt:get(), ",")
  lvim.builtin.cmp.completion.completeopt = "menu,menuone,noinsert"
  -- lvim.builtin.cmp.experimental = {
  -- 	ghost_text = "CmpGhostText",
  -- }
  local cmp_sources = {
    ["vim-dadbod-completion"] = "DadBod",
    buffer = "Buffer",
    cmp_tabnine = "TabNine",
    codeium = "Codeium",
    crates = "Crates",
    latex_symbols = "LaTeX",
    nvim_lua = "NvLua",
  }
  lvim.builtin.cmp.formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      if entry.source.name == "cmdline" then
        vim_item.kind = "⌘"
        vim_item.menu = ""
        return vim_item
      end
      vim_item.menu = cmp_sources[entry.source.name] or vim_item.kind
      vim_item.kind = kind.cmp_kind[vim_item.kind] or vim_item.kind

      return vim_item
    end,
  }

  local cmp_ok, cmp = pcall(require, "cmp")
  if not cmp_ok or cmp == nil then
    cmp = {
      mapping = function(...) end,
      setup = { filetype = function(...) end, cmdline = function(...) end },
      config = { sources = function(...) end },
    }
  end

  if lvim.user_plugins.edit.completion.cmp.cmd then
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!", "IncRename" },
          },
        },
      },
    })
  end
  if lvim.user_plugins.edit.completion.cmp.fuzzy then
    cmp.setup.cmdline("/", {
      sources = cmp.config.sources({
        { name = "fuzzy_buffer" },
      }),
    })
    cmp.setup.cmdline("?", {
      sources = cmp.config.sources({
        { name = "fuzzy_buffer" },
      }),
    })
  end
  cmp.setup.filetype("toml", {
    sources = cmp.config.sources({
      { name = "nvim_lsp", max_item_count = 8 },
      { name = "crates" },
      { name = "luasnip", max_item_count = 5 },
    }, {
      { name = "buffer", max_item_count = 5, keyword_length = 5 },
    }),
  })
  cmp.setup.filetype("tex", {
    sources = cmp.config.sources({
      { name = "latex_symbols", max_item_count = 3, keyword_length = 3 },
      { name = "nvim_lsp", max_item_count = 8 },
      { name = "luasnip", max_item_count = 5 },
    }, {
      { name = "buffer", max_item_count = 5, keyword_length = 5 },
    }),
  })

  -- if lvim.builtin.user_copilot.active then
  -- 	local function t(str)
  -- 		return vim.api.nvim_replace_termcodes(str, true, true, true)
  -- 	end

  -- 	lvim.builtin.cmp.mapping["<c-h>"] = cmp.mapping(function()
  -- 		vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](t("<Tab>")), "n", true)
  -- 	end)
  -- 	lvim.keys.insert_mode["<M-]>"] = { "<Plug>(copilot-next)", { silent = true } }
  -- 	lvim.keys.insert_mode["<M-[>"] = { "<Plug>(copilot-previous)", { silent = true } }
  -- 	lvim.keys.insert_mode["<M-\\>"] = { "<Cmd>vertical Copilot panel<CR>", { silent = true } }
  -- 	lvim.builtin.cmp.mapping["<Tab>"] = cmp.mapping(M.tab, { "i", "c" })
  -- 	lvim.builtin.cmp.mapping["<S-Tab>"] = cmp.mapping(M.shift_tab, { "i", "c" })
  -- end

  function M.tab(fallback)
    local methods = require("lvim.core.cmp").methods
    local luasnip = require("luasnip")
    -- local copilot_keys = vim.fn["copilot#Accept"]()
    if cmp.visible() then
      cmp.select_next_item()
    elseif vim.api.nvim_get_mode().mode == "c" then
      fallback()
    elseif luasnip.expand_or_locally_jumpable() then
      luasnip.expand_or_jump()
    -- elseif copilot_keys ~= "" then -- prioritise copilot over snippets
    -- Copilot keys do not need to be wrapped in termcodes
    -- vim.api.nvim_feedkeys(copilot_keys, "i", true)
    elseif methods.jumpable(1) then
      luasnip.jump(1)
    elseif methods.has_words_before() then
      -- cmp.complete()
      fallback()
    else
      methods.feedkeys("<Plug>(Tabout)", "")
    end
  end

  function M.shift_tab(fallback)
    local methods = require("lvim.core.cmp").methods
    local luasnip = require("luasnip")
    if cmp.visible() then
      cmp.select_prev_item()
    elseif vim.api.nvim_get_mode().mode == "c" then
      fallback()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      -- local copilot_keys = vim.fn["copilot#Accept"]()
      -- if copilot_keys ~= "" then
      -- 	methods.feedkeys(copilot_keys, "i")
      -- else
      methods.feedkeys("<Plug>(Tabout)", "")
      -- end
    end
  end

  lvim.builtin.cmp.mapping["<Tab>"] = cmp.mapping(M.tab, { "i", "c" })
  lvim.builtin.cmp.mapping["<S-Tab>"] = cmp.mapping(M.shift_tab, { "i", "c" })
end

return M
