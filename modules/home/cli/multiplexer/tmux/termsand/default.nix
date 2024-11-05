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
        sources
        ;
      cfg = cfgHome config.${namespace} ./.;
      source = (
        pkgs.fetchFromGitHub {
          inherit (sources.termsand.src)
            owner
            repo
            rev
            sha256
            ;
        }
      );
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
