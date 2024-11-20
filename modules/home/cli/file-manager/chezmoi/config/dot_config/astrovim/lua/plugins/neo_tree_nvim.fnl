(let [help (require :help)
      repo :neo-tree.nvim
      enabled (help.enabled repo)]
  {1 (help.name :nvim-neo-tree repo) : enabled})
