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
          plugin = pkgs.tmuxPlugins.session-wizard;
          extraConfig = ''
            set -g @session-wizard '${cfg.key}'
          '';
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str "k";
        path = mkOpt' lib.types.str "${pkgs.tmuxPlugins.session-wizard}/share/tmux-plugins/session-wizard/session-wizard.sh";
        command = mkOpt' lib.types.str ''display-popup -w "80"% -h "40"% -E ${cfg.path}'';
      };
    }
  )
)
