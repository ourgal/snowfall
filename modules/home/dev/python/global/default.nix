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
      path = ./.;
      value = {
        home.packages = [
          (pkgs.python3.withPackages (
            ps:
            [ ps.websockets ]
            ++ lib.${namespace}.with' ps cfg.pkgs
            ++ lib.optionals config.${namespace}.cli.download.aria2.enable (
              [ ps.aria2p ] ++ ps.aria2p.optional-dependencies.tui
            )
          ))
        ];
      };
      extraOpts = {
        pkgs = mkOpt' (lib.types.listOf lib.types.str) [ ];
      };
    }
  )
)
