args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.tmux.plugins = [
        {
          plugin = pkgs.${namespace}.tmux2k;
          extraConfig = ''
            set -g @tmux2k-left-plugins "cpu-usage ram-usage"
            set -g @tmux2k-show-left-icon "session"
          '';
        }
      ];

    }
  )
)
