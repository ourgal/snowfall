return {
  "rmagatti/goto-preview",
  config = true,
  -- init = function()
  -- 	lvim.builtin.which_key.mappings["lp"] =
  -- 		{ ":lua require('goto-preview').goto_preview_definition()<CR>", "Peek definition" }
  -- end,
  keys = {
    {
      "gp",
      nil,
      desc = "Goto Preview",
    },
    {
      "gpd",
      function()
        require("goto-preview").goto_preview_definition()
      end,
      desc = "Peek definition",
    },
    {
      "gpt",
      function()
        require("goto-preview").goto_preview_type_definition()
      end,
      desc = "Peek type definition",
    },
    {
      "gpi",
      function()
        require("goto-preview").goto_preview_implementation()
      end,
      desc = "Peek implementation",
    },
    {
      "gpr",
      function()
        require("goto-preview").goto_preview_references()
      end,
      desc = "Peek references",
    },
  },
  enabled = lvim.user_plugins.edit.lsp.go_to,
}
