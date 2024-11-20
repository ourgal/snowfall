(let [mode {:mode :i}
      cmd #(.. "<cmd>lua require('backout')." $1 "()<cr>")
      help (require :help)
      repo :backout.nvim
      enabled (help.enabled repo :jump)]
  {1 (help.name :AgusDOLARD repo)
   :config true
   : enabled
   :keys [[:<M-b> (cmd :back) mode] [:<M-n> (cmd :out) mode]]})
