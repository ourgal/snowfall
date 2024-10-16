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
          plugins = with pkgs.${namespace}; [ vim-auto-save ];
          extraConfig = ''
            let g:auto_save = v:true
            let g:auto_save_silent = v:true
          '';
        };
      };
    }
  )
)
