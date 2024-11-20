(let [help (require :help)
      repo :resession.nvim
      enabled (help.enabled repo :session)]
  {1 (help.name :stevearc repo) : enabled :opts {:extensions {:astrocore {}}}})
