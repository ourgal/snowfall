return {
  "nathom/filetype.nvim",
  opts = {
    overrides = {
      literal = {
        ["kitty.conf"] = "kitty",
        [".gitignore"] = "conf",
      },
      complex = {
        [".clang*"] = "yaml",
        [".*%.env.*"] = "sh",
        [".*ignore"] = "conf",
      },
      extensions = {
        tf = "terraform",
        tfvars = "terraform",
        hcl = "hcl",
        tfstate = "json",
        eslintrc = "json",
        prettierrc = "json",
        mdx = "markdown",
        sql = "sql",
        c = "c",
        java = "java",
        sh = "bash",
      },
    },
  },
  enabled = lvim.user_plugins.edit.filetype,
}
