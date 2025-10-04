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
      progs.tmux.plugins = [
        {
          plugin = pkgs.tmuxPlugins.tmux-sessionx;
          extraConfig = ''
            set -g @sessionx-bind '${cfg.key}'
          '';
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str "o";
        path = mkOpt' lib.types.str "${pkgs.tmuxPlugins.tmux-sessionx}/share/tmux-plugins/tmux-sessionx/sessionx.sh";
        command = mkOpt' lib.types.str ''display-popup -w "80"% -h "40"% -E ${cfg.path}'';
      };
    }
  )
)
