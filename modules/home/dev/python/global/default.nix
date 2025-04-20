args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        config
        namespace
        lib
        mkOpt'
        cfgHome
        ;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      value = {
        home.packages = [ (pkgs.python3.withPackages (ps: [ ps.websockets ] ++ (cfg.pkgs ps))) ];
      };
      extraOpts = {
        pkgs = mkOpt' (lib.types.functionTo (lib.types.listOf lib.types.package)) (_p: [ ]);
      };
    }
  )
)
