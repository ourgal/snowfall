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
          plugins = with pkgs.${namespace}; [ vim-templates ];
          extraConfig = ''
            let g:tmpl_auto_initialize = 1
            let g:tmpl_search_paths = ['~/.vim/templates']
          '';
        };
      };
    }
  )
)
