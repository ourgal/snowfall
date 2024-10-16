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
          plugins = with pkgs.${namespace}; [ vim-toop ];
          extraConfig = ''
            function! Duplicate(string)
                return a:string.a:string
            endfun
            call toop#mapFunction('Duplicate', "ym")

            call toop#mapShell('sort', 'gz')
          '';
        };
      };
    }
  )
)
