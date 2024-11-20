(local enabled {:enable true})
(local disabled {:enable false})
(local plugins
       {:autosave {:autosave_nvim enabled}
        :jump {:backout_nvim enabled}
        :file {:bufexplorer disabled :neo_tree_nvim disabled}
        :share {:carbon_now_nvim enabled
                :vim_carbon_now_sh disabled
                :vim_silicon enabled}
        :lang {:lisp {:parinfer_rust enabled}}
        :edit {:align {:mini_align enabled}
               :copy {:cutlass_nvim disabled}
               :comment {:mini_comment enabled}
               :surround {:mini_surround disabled
                          :nvim_surround enabled
                          :vim_surround disabled}
               :macro {:nvim_recorder disabled :vim_macrobatics disabled}
               :ca_cx {:nvim_toggler disabled :vim_cycle enabled}
               :search {:vim_grepper enabled}
               :replace {:vim_subversive disabled :vim_exchange enabled}
               :mini_bracketed enabled
               :mini_operators enabled
               :scrollofffraction_nvim enabled
               :vim_zoom enabled
               :visual_split_vim enabled}
        :git {:git_messenger_vim enabled}
        :session {:neovim_session_manager disabled
                  :persisted_nvim disabled
                  :persistence_nvim disabled
                  :resession_nvim enabled}
        :terminal {:toggleterm_nvim disabled :vim_floaterm enabled}
        :build {:vim_dispatch enabled}
        :doc {:zeavim_vim enabled}
        :colorscheme {:catppuccin enabled :tokyonight_nvim enabled}})

(global Dot {: plugins})

(require :config.lazy)
