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
          plugins = with pkgs.${namespace}; [ vlime ];
          extraConfig = ''
            let g:vlime_cl_impl = "my_sbcl"
            function! VlimeBuildServerCommandFor_my_sbcl(vlime_loader, vlime_eval)
                return ["sbcl", "--load", a:vlime_loader, "--eval", a:vlime_eval]
            endfunction
          '';
        };
      };
    }
  )
)
