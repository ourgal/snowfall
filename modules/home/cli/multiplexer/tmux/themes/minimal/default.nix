args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
      selectionBox = {
        default = "";
        edged = ''
          set -g @minimal-tmux-use-arrow true
        '';
        rounded = ''
          set -g @minimal-tmux-use-arrow true
          set -g @minimal-tmux-right-arrow ""
          set -g @minimal-tmux-left-arrow ""
        '';
      };
    in
    {
      progs.tmux.plugins = [
        {
          plugin = pkgs.${namespace}.minimal-tmux-status;
          extraConfig = ''
            set -g @minimal-tmux-justify "centre"
            set -g @minimal-tmux-status "top"

            set -g @minimal-tmux-indicator-str " tmux "
            set -g @minimal-tmux-indicator true

            set -g @minimal-tmux-status-right " #S "

            ${selectionBox.rounded}

          '';
        }
      ];
    }
  )
)
