return {
  "LudoPinelli/comment-box.nvim",
  cmd = { "CBlbox", "CBclbox", "CBcbox", "CBccbox", "CBalbox", "CBaclbox", "CBacbox", "CBaccbox" },
  keys = {
    { "<leader>C1", "<cmd>CBlbox<CR>", desc = "Left fixed box Left text", mode = { "n", "v" } },
    { "<leader>C2", "<cmd>CBclbox<CR>", desc = "Centered fixed box Left text", mode = { "n", "v" } },
    { "<leader>C3", "<cmd>CBcbox<CR>", desc = "Left fixed box centered text", mode = { "n", "v" } },
    { "<leader>C4", "<cmd>CBccbox<CR>", desc = "Centered fixed box centered text", mode = { "n", "v" } },
    { "<leader>C5", "<cmd>CBalbox<CR>", desc = "Left adapted box Left text", mode = { "n", "v" } },
    { "<leader>C6", "<cmd>CBaclbox<CR>", desc = "Centered adapted box Left text", mode = { "n", "v" } },
    { "<leader>C7", "<cmd>CBacbox<CR>", desc = "Left adapted box centered text", mode = { "n", "v" } },
    { "<leader>C8", "<cmd>CBaccbox<CR>", desc = "Centered box centered text", mode = { "n", "v" } },
  },
  enabled = lvim.user_plugins.edit.comment.box,
}
