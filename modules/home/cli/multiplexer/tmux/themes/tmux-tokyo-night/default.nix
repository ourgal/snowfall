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
          plugin = pkgs.${namespace}.tmux-tokyo-night;
          extraConfig = ''
            # Choose theme variation (night, storm, moon, day)
            set -g @theme_variation 'night'

            # Enable your favorite plugins (comma-separated)
            set -g @theme_plugins 'git,battery,loadavg,datetime'

            set -g @theme_plugin_cache_clear_key ""
            set -g @theme_plugin_kubernetes_context_selector_key ""
            set -g @theme_plugin_kubernetes_namespace_selector_key ""
            set -g @theme_plugin_microphone_mute_key ""
            set -g @theme_helper_key ""

            set -g status-position top
          '';
        }
      ];
    }
  )
)
