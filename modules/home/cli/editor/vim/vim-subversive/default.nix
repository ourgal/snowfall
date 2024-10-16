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
          plugins = with pkgs.vimPlugins; [ vim-subversive ];
          extraConfig = ''
            nnoremap r <plug>(SubversiveSubstitute)
            xnoremap r <plug>(SubversiveSubstitute)
          '';
        };
      };
    }
  )
)
