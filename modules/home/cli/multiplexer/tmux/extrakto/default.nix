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
          plugin = pkgs.tmuxPlugins.extrakto;
          extraConfig = ''
            set -g @extrakto_key ${cfg.key}
          '';
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str "i";
        path = mkOpt' lib.types.str "${pkgs.tmuxPlugins.extrakto}/share/tmux-plugins/extrakto/scripts/helpers.sh";
        command = mkOpt' lib.types.str "run-shell ${cfg.path} #{pane_id}";
      };
    }
  )
)
