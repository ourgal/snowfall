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
          plugins = with pkgs.vimPlugins; [ vim-dispatch ];
          extraConfig = ''
            let g:dispatch_no_maps = 1
            autocmd FileType lisp let b:dispatch = 'sbcl --script %'
            nmap <leader>.. <cmd>Dispatch<cr>
          '';
        };
      };
    }
  )
)
