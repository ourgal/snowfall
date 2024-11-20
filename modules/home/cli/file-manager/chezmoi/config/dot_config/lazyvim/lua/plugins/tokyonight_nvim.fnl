(let [help (require :help)
      repo :tokyonight.nvim
      enabled (help.enabled repo :colorscheme)]
  {1 (help.name :folke repo)
   : enabled
   :opts {:styles {:floats :transparent :sidebars :transparent}
          :transparent false}})
