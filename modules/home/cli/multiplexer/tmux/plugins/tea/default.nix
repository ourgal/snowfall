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
          plugin = pkgs.${namespace}.tmux-tea;
          extraConfig = ''
            set -g @tea-bind ${cfg.key};
          '';
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str "T";
        path = mkOpt' lib.types.str "${pkgs.${namespace}.tmux-tea}/share/tmux-plugins/tmux-tea/bin/tea.sh";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
    }
  )
)
