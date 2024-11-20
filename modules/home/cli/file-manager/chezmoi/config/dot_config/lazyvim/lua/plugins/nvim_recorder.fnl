(let [help (require :help)
      repo :nvim-recorder
      enabled (help.enabled repo :edit :macro)]
  {1 (help.name :chrisgrieser repo) : enabled :opts {:slots [:a :b :c :d]}})
