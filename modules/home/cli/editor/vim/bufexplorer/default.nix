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
          plugins = with pkgs.vimPlugins; [ bufexplorer ];
          extraConfig = ''
            nnoremap <leader>be <cmd>BufExplorer<cr>
            nnoremap <leader>bt <cmd>ToggleBufExplorer<cr>
            nnoremap <leader>bs <cmd>BufExplorerHorizontalSplit<cr>
            nnoremap <leader>bv <cmd>BufExplorerVerticalSplit<cr>
          '';
        };
      };
    }
  )
)
