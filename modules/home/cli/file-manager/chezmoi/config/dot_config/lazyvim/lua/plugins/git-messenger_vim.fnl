(let [help (require :help)
      repo :git-messenger.vim
      enabled (help.enabled repo :git)]
  {1 (help.name :rhysd repo)
   :cmd :GitMessenger
   : enabled
   :init #(set _G.vim.g.git_messenger_no_default_mappings true)
   :keys [{1 :<leader>gm 2 "<Plug>(git-messenger)" :desc "Git messenger"}]})
