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
          plugins = with pkgs.vimPlugins; [ vim-grepper ];
          extraConfig = ''
            nmap g/ <plug>(GrepperOperator)
            xmap g/ <plug>(GrepperOperator)
          '';
        };
      };
    }
  )
)
