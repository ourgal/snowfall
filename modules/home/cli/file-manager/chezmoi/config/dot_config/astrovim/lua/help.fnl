(let [enabled (fn [repo ...]
                (var tmp _G.Dot.plugins)
                (local repo (-> (repo:gsub "%." "_") (: :gsub "-" "_")))
                (each [_ v (ipairs [...])]
                  (set tmp (. tmp v)))
                (-> tmp (. repo) (. :help)))
      name (fn [author repo]
             (.. author "/" repo))
      core (require :astrocore)
      map core.set_mappings]
  {: enabled : name : map})
