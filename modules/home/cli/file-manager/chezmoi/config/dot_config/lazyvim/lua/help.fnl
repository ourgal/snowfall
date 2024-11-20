(let [enabled (fn [repo ...]
                (var tmp _G.Dot.plugins)
                (local repo (-> (repo:gsub "%." "_") (: :gsub "-" "_")))
                (each [_ v (ipairs [...])]
                  (set tmp (. tmp v)))
                (-> tmp (. repo) (. :enable)))
      name (fn [author repo]
             (.. author "/" repo))]
  {: enabled : name})
