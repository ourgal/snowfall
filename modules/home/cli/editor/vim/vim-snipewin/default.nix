{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs = {
        vim = {
          plugins = with pkgs.${namespace}; [ vim-snipewin ];
          extraConfig = ''
            nnoremap <leader><space> <Plug>(snipewin)
          '';
        };
      };
    }
  )
)
