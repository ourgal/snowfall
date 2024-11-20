(let [help (require :help)
      repo :zeavim.vim
      enabled (help.enabled repo :doc)]
  {1 (help.name :KabbAmine repo)
   :cmd [:Zeavim :ZeavimV]
   : enabled
   :init #(set _G.vim.g.zv_file_types
               {:scss :sass :sh :bash :tex :latex :yaml.ansible :ansible})
   :keys [{1 :<leader>z 2 :<Plug>Zeavim :desc :Zeal}
          {1 :<leader>z 2 :<Plug>ZVVisSelection :desc :Zeal :mode :v}
          {1 :g? 2 :<Plug>ZVOperator :desc :Zeal}]})
