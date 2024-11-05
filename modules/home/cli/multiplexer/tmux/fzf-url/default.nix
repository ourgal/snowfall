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
      progs.tmux.plugins = [ pkgs.${namespace}.tmux-fzf-url ];
      extraOpts = {
        key = mkOpt' lib.types.str "u";
        path = mkOpt' lib.types.str "${pkgs.${namespace}.tmux-fzf-url}/share/tmux-plugins/tmux-fzf-url/fzf-url.sh";
        command = mkOpt' lib.types.str ''run-shell -b ${cfg.path} "" "screen" ""'';
      };
    }
  )
)
