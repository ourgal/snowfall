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
      progs.tmux.plugins = [ pkgs.tmuxPlugins.fuzzback ];
      extraOpts = {
        key = mkOpt' lib.types.str "?";
        path = mkOpt' lib.types.str "${pkgs.tmuxPlugins.fuzzback}/share/tmux-plugins/extrakto/scripts/fuzzback.sh";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
      value.${namespace}.user.tmux.keys = [ cfg.key ];
    }
  )
)
