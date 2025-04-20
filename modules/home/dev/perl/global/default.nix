args:
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
      value = {
        home.packages = [
          (pkgs.perl.withPackages (
            ps:
            with ps;
            [
              PerlLanguageServer
              PerlTidy
              PerlCritic
              PLS
            ]
            ++ (cfg.pkgs ps)
          ))
        ];
      };
      extraOpts = {
        pkgs = mkOpt' (lib.types.functionTo (lib.types.listOf lib.types.package)) (_p: [ ]);
      };
    }
  )
)
