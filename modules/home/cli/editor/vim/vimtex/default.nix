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
          plugins = with pkgs.vimPlugins; [ vimtex ];
          extraConfig = ''
            let g:vimtex_compiler_method = 'tectonic'
            let g:vimtex_view_method = 'zathura'
          '';
        };
      };
    }
  )
)
