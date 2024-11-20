(local enabled {:active true})
(local disabled {:active false})
(local plugins
       {:autosave {:autosave_nvim enabled}
        :jump {:backout_nvim enabled}
        :file {:bufexplorer disabled :neo_tree_nvim disabled}
        :share {:carbon_now_nvim enabled
                :vim_carbon_now_sh disabled
                :vim_silicon enabled}
        :edit {:cutlass_nvim disabled
               :mini_align enabled
               :mini_bracketed enabled
               :mini_comment enabled
               :mini_operators enabled
               :nvim_recorder disabled
               :mini_surround disabled
               :nvim_surround enabled
               :nvim_toggler disabled
               :parinfer_rust enabled
               :scrollofffraction_nvim enabled
               :vim_exchange enabled
               :vim_grepper enabled
               :vim_macrobatics disabled
               :vim_subversive disabled
               :vim_surround disabled
               :vim_zoom enabled
               :visual_split_vim enabled
               :vim_cycle enabled}
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
