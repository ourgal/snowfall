{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs = {
        vim = {
          plugins = with pkgs.vimPlugins; [ vim-gitgutter ];
          extraConfig = ''
            let g:gitgutter_map_keys = 0
            nnoremap <leader>gs <Plug>(GitGutterStageHunk)
            nnoremap <leader>gu <Plug>(GitGutterUndoHunk)
            nnoremap <leader>gz <cmd>GitGutterFold<cr>
          '';
        };
      };
    }
  )
)
