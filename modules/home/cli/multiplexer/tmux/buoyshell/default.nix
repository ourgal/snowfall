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
          plugin = pkgs.${namespace}.tmux-buoyshell;
          extraConfig = "set -g @buoyshell-key '${cfg.key}'";
        }
      ];
      extraOpts = {
        key = mkOpt' lib.types.str "o";
        path = mkOpt' lib.types.str "${pkgs.${namespace}.tmux-floax}/share/tmux-plugins/tmux-buoyshell/scripts/buoy.sh";
        command = mkOpt' lib.types.str ''if-shell -F "#{==:#{client_session},$buoy_session}" "detach-client" "run-shell '${cfg.path}'"'';
      };
    }
  )
)
