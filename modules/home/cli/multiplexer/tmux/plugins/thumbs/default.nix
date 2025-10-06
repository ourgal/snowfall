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
      inherit (lib.types) str;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      progs.tmux = {
        plugins = [ { plugin = pkgs.tmuxPlugins.tmux-thumbs; } ];
        extraConfig = ''
          bind-key ${cfg.key} thumbs-pick
        '';
      };
      extraOpts = {
        key = mkOpt' str ".";
        path = mkOpt' str "${pkgs.tmuxPlugins.tmux-thumbs}/share/tmux-plugins/tmux-thumbs/tmux-thumbs.sh";
        command = mkOpt' str "run-shell -b ${cfg.path}";
      };
      value.${namespace}.user.tmux.keys = [ cfg.key ];
    }
  )
)
