(let [help (require :help)
      repo :vim-macrobatics
      enabled (help.enabled repo :edit)]
  {1 (help.name :svermeulen repo)
   :dependencies :junegunn/fzf.vim
   : enabled
   :keys [{1 :q 2 "<plug>(Mac_Play)" :silent true}
          {1 :Q 2 "<plug>(Mac_RecordNew)" :silent true}
          {1 "[@"
           2 "<plug>(Mac_RotateBack)"
           :desc "Macro history back"
           :silent true}
          {1 "]@"
           2 "<plug>(Mac_RotateForward)"
           :desc "Macro history forward"
           :silent true}
          {1 "<leader>@n"
           2 "<plug>(Mac_NameCurrentMacro)"
           :desc "Name current macro"
           :silent true}
          {1 "<leader>@s"
           2 "<plug>(Mac_SearchForNamedMacroAndSelect)"
           :desc "Select macro"
           :silent true}
          {1 "<leader>@h"
           2 :<cmd>DisplayMacroHistory<cr>
           :desc "Macro history"
           :silent true}
          {1 "<leader>@A"
           2 "<plug>(Mac_Append)"
           :desc "Macro append"
           :silent true}
          {1 "<leader>@I"
           2 "<plug>(Mac_Prepend)"
           :desc "Macro prepend"
           :silent true}
          {1 "<leader>@p"
           2 "<plug>(Mac_SearchForNamedMacroAndPlay)"
           :desc "Select macro and play"
           :silent true}
          {1 "<leader>@u"
           2 "<plug>(Mac_SearchForNamedMacroAndOverwrite)"
           :desc "Update macro"
           :silent true}
          {1 "<leader>@d"
           2 "<plug>(Mac_SearchForNamedMacroAndDelete)"
           :desc "Delete macro"
           :silent true}
          {1 "<leader>@r"
           2 "<plug>(Mac_SearchForNamedMacroAndRename)"
           :desc "Rename macro"
           :silent true}]
   :lazy false})
