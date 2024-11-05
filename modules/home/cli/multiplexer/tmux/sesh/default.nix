args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        namespace
        toTOML
        mkOpt'
        lib
        cfgHome
        config
        ;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      nixPkgs = "sesh";
      progs.tmux.extraConfig = "bind ${cfg.key} ${cfg.command}";
      confs = {
        "sesh/sesh.toml" = toTOML {
          default_session = {
            startup_command = "tmuxinator local";
          };
        };
      };
      extraOpts = {
        key = mkOpt' lib.types.str "t";
        path = mkOpt' lib.types.str "${pkgs.${namespace}.tmux-sesh}/bin/tmux-sesh";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
    }
  )
)
