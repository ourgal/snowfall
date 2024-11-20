(let [help (require :help)
      repo :vim-dispatch
      enabled (help.enabled repo :build)]
  {1 (help.name :tpope repo)
   : enabled
   :keys [{1 :<leader>.. 2 :<cmd>Dispatch<cr> :desc :Dispatch}]})
