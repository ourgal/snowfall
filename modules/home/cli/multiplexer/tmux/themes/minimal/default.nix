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
          plugin = pkgs.${namespace}.minimal-tmux-status;
          extraConfig = ''
            set -g @minimal-tmux-justify "left"
            set -g @minimal-tmux-status "top"
          '';
        }
      ];
    }
  )
)
