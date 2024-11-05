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
      progs.tmux.plugins = [ pkgs.tmuxPlugins.jump ];
      extraOpts = {
        key = mkOpt' lib.types.str "j";
        path = mkOpt' lib.types.str "${pkgs.tmuxPlugins.jump}/share/tmux-plugins/jump/scripts/tmux-jump.sh";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
    }
  )
)
