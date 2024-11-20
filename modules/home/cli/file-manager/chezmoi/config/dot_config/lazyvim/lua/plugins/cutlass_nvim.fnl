(let [map (fn [l]
            (icollect [_ v (ipairs l)]
              [v {:mode [:n :v]}]))
      help (require :help)
      repo :cutlass.nvim
      enabled (help.enabled repo :edit)]
  {1 (help.name :gbprod repo)
   : enabled
   :keys (map [:d :D :c :C :x])
   :opts {:cut_key :<A-x> :exclude [:s<space>]}})
