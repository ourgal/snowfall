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
          plugin = pkgs.${namespace}.tmux-paste-image;
          extraConfig = ''
            set -g @paste-image-key ${cfg.key}
          '';
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str "P";
        path = mkOpt' lib.types.str "${pkgs.${namespace}.tmux-tome}/share/tmux-plugins/tmux-paste-image/scripts/paster.sh";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
      value.${namespace}.user.tmux.keys = [ cfg.key ];
    }
  )
)
