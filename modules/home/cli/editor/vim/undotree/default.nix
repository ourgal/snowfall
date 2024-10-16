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
          plugins = with pkgs.vimPlugins; [ undotree ];
          extraConfig = ''
            let g:undotree_SetFocusWhenToggle = 1
          '';
        };
      };
    }
  )
)
