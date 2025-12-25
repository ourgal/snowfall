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
          plugin = pkgs.${namespace}.tmux-powerkit;
          extraConfig = ''
            # Choose theme variation (night, storm, moon, day)
            set -g @powerkit_theme 'tokyo-night'
            set -g @powerkit_theme_variant 'night'

            # Enable your favorite plugins (comma-separated)
            set -g @powerkit_plugins 'git,battery,loadavg,datetime'

            set -g @powerkit_plugin_cache_clear_key ""
            set -g @powerkit_plugin_kubernetes_context_selector_key ""
            set -g @powerkit_plugin_kubernetes_namespace_selector_key ""
            set -g @powerkit_plugin_microphone_mute_key ""
            set -g @powerkit_helper_key ""

            set -g status-position top
          '';
        }
      ];
    }
  )
)
