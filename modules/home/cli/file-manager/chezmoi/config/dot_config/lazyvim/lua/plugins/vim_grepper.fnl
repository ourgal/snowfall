(let [help (require :help)
      repo :vim-grepper
      enabled (help.enabled repo :edit)]
  {1 (help.name :mhinz repo)
   :cmd [:Grepper :GrepperGit :GrepperAg :GrepperRg]
   : enabled
   :keys [{1 :g/ 2 "<plug>(GrepperOperator)" :mode [:n :x]}]})
