args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        namespace
        mkOpt'
        lib
        cfgHome
        config
        ;
      cfg = cfgHome config.${namespace} ./.;
      source = pkgs._sources.termsand.src;
    in
    {
      path = ./.;
      myPkgs = "termsand";
      progs.tmux.extraConfig = "bind ${cfg.key} ${cfg.command}";
      extraOpts = {
        key = mkOpt' lib.types.str "E";
        path = mkOpt' lib.types.str "${source}/sand.sh";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
    }
  )
)
