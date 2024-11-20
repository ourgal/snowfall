(local enabled {:enable true})
(local disabled {:enable false})
(local plugins {:autosave_nvim disabled
                :persisted_nvim disabled
                :vim_floaterm enabled
                :astrocore enabled
                :neo_tree_nvim disabled
                :session {:resession_nvim enabled}})

(global Dot {: plugins})

(require :lazy_install)
(require :lazy_setup)
(require :polish)
