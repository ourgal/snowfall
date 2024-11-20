(let [map (fn [key cmd desc]
            [(.. :<leader> key) (.. (.. :<cmd> cmd) :<cr>) {: desc}])
      help (require :help)
      repo :bufexplorer
      enabled (help.enabled repo :file)]
  {1 (help.name :jlanzarotta repo)
   : enabled
   :keys [(map :be :BufExplorer :Explorer)
          (map :bt :ToggleBufExplorer "Toggle explorer")
          (map :bs :BufExplorerHorizontalSplit "Explorer split")
          (map :bv :BufExplorerVerticalSplit "Explorer vsplit")]})
