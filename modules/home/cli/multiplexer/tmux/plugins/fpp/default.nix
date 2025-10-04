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
    in
    {
      progs.tmux.plugins = [ pkgs.tmuxPlugins.fpp ];
      extraOpts = {
        key = mkOpt' lib.types.str "f";
        path = mkOpt' lib.types.str "${pkgs.tmuxPlugins.fpp}/share/tmux-plugins/fpp/scripts/fpp.tmux";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
    }
  )
)
