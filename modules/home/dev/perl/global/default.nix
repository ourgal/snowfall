{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        mkOpt'
        lib
        namespace
        cfgHome
        config
        ;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      value = {
        home.packages = [
          (pkgs.perl.withPackages (
            ps:
            [
              ps.PerlLanguageServer
              ps.PerlTidy
            ]
            ++ lib.${namespace}.with' ps cfg.pkgs
          ))
        ];
      };
      extraOpts = {
        pkgs = mkOpt' (lib.types.listOf lib.types.str) [ ];
      };
    }
  )
)
