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
      path = ./.;
      progs.tmux.plugins = [ pkgs.${namespace}.tmux-power-zoom ];
      extraOpts = {
        key = mkOpt' lib.types.str "Z";
        path = mkOpt' lib.types.str "${
          pkgs.${namespace}.tmux-power-zoom
        }/share/tmux-plugins/tmux-power-zoom/scripts/power_zoom.sh";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
    }
  )
)
