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
          plugin = pkgs.${namespace}.tmux-tome;
          extraConfig = ''
            set -g @tome_key ${cfg.key};
            set -g @tome_scratch-key ${cfg.key};
            set -g @tome_playbook .playbook.fish;
          '';
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str "a";
        path = mkOpt' lib.types.str "${pkgs.${namespace}.tmux-tome}/share/tmux-plugins/tmux-tome/tome-open-playbook";
        command = mkOpt' lib.types.str "run-shell -b ${cfg.path}";
      };
    }
  )
)
