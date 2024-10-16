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
          plugins = with pkgs.vimPlugins; [ vim-easy-align ];
          extraConfig = ''
            xmap ga <Plug>(EasyAlign)
            nmap ga <Plug>(EasyAlign)
          '';
        };
      };
    }
  )
)
