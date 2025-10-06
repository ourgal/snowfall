args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        pkgs
        lib
        host
        namespace
        ;
      inherit (lib.${namespace}.settings) laptops;
      openpomodoro =
        if config.${namespace}.cli.time-tracking.openpomodoro-cli.enable then
          "set -ga status-left '#[bg=#(pomodoro tmux-color)]🍅'"
        else
          "";
    in
    {
      progs.tmux.plugins = [
        pkgs.${namespace}.tmux-loadavg
        pkgs.tmuxPlugins.battery
      ];
      value = {
        catppuccin.tmux.extraConfig = lib.mkIf config.catppuccin.tmux.enable ''
          # Configure Catppuccin
          set -g @catppuccin_flavor "macchiato"
          set -g @catppuccin_status_background "none"
          set -g @catppuccin_window_status_style "none"
          set -g @catppuccin_pane_status_enabled "off"
          set -g @catppuccin_pane_border_status "off"

          # status left look and feel
          set -g status-left-length 100
          set -g status-left ""
          ${openpomodoro}
          set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold] #S },#{#[bg=#{@thm_bg},fg=#{@thm_blue}] #S }}"
          set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
          set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_maroon}]#{E:@catppuccin_gitmux_text}"
          set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"
          set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"

          # status right look and feel
          set -g status-right-length 100
          set -g status-right ""
          ${
            if (builtins.elem host laptops) then
              ''
                set -ga status-right "#{?#{e|>=:10,#{battery_percentage}},#{#[bg=#{@thm_red},fg=#{@thm_bg}]},#{#[bg=#{@thm_bg},fg=#{@thm_pink}]}} #{battery_icon} #{battery_percentage} "
                set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}, none]│"
              ''
            else
              ""
          }
          set -ga status-right "#[bg=#{@thm_bg}] #{load_full} "

          # Configure Tmux
          set -g status-position top
          set -g status-style "bg=#{@thm_bg}"
          set -g status-justify "absolute-centre"

          # pane border look and feel
          setw -g pane-border-format ""
          setw -g pane-active-border-style "bg=#{@thm_bg},fg=#{@thm_overlay_0}"
          setw -g pane-border-style "bg=#{@thm_bg},fg=#{@thm_surface_0}"
          setw -g pane-border-lines single

          # window look and feel
          set -wg automatic-rename on
          set -g automatic-rename-format "Window"

          set -g window-status-format " #I#{?#{!=:#{window_name},Window},: #W,} "
          set -g window-status-style "bg=#{@thm_bg},fg=#{@thm_rosewater}"
          set -g window-status-last-style "bg=#{@thm_bg},fg=#{@thm_peach}"
          set -g window-status-activity-style "bg=#{@thm_red},fg=#{@thm_bg}"
          set -g window-status-bell-style "bg=#{@thm_red},fg=#{@thm_bg},bold"
          set -gF window-status-separator "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}]│"

          set -g window-status-current-format " #I#{?#{!=:#{window_name},Window},: #W,} "
          set -g window-status-current-style "bg=#{@thm_peach},fg=#{@thm_bg},bold"
        '';
      };

    }
  )
)
