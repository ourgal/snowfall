args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.tmux.plugins = [
        {
          plugin = pkgs.tmuxPlugins.dracula;
          extraConfig = ''
            # available plugins: battery, cpu-usage, git, gpu-usage, ram-usage, tmux-ram-usage, network, network-bandwidth, network-ping, ssh-session, attached-clients, network-vpn, weather, time, mpc, spotify-tui, kubernetes-context, synchronize-panes
            set -g @dracula-plugins "cpu-usage ram-usage battery"

            set -g @dracula-show-powerline true
            set -g @dracula-refresh-rate 10

            set -g @dracula-show-fahrenheit false
            set -g @dracula-fixed-location "Ningbo"
            set -g @dracula-show-location false

            set -g @dracula-show-left-icon session

            set -g @dracula-ping-server "223.5.5.5"
            set -g @dracula-ping-rate 5

            set -g @dracula-show-timezone false

            set -g @dracula-cpu-display-load true

            set -g @dracula-border-contrast true
          '';
        }
      ];
    }
  )
)
