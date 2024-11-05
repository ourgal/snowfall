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
          plugin = pkgs.tmuxPlugins.tmux-thumbs;
          extraConfig = ''
            set -g @thumbs-key ${cfg.key};
          '';
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str ".";
        path = mkOpt' lib.types.str "${pkgs.tmuxPlugins.tmux-thumbs}/share/tmux-plugins/tmux-thumbs/tmux-thumbs.sh";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
    }
  )
)
