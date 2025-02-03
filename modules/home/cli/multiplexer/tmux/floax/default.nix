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
      progs.tmux.plugins = [
        {
          plugin = pkgs.${namespace}.tmux-floax;
          extraConfig = "set -g @floax-bind '${cfg.key}'";
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str "o";
        path = mkOpt' lib.types.str "${pkgs.${namespace}.tmux-floax}/share/tmux-plugins/tmux-floax/scripts/floax.sh";
        command = mkOpt' lib.types.str "run-shell ${cfg.path}";
      };
    }
  )
)
