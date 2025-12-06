args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        pkgs
        lib
        namespace
        host
        ;
      inherit (lib.${namespace}.settings) laptops;
      openpomodoro =
        if config.${namespace}.cli.time-tracking.openpomodoro-cli.enable then
          "set -agF status-left '#[bg=#(pomodoro tmux-color)]🍅'"
        else
          "";
      gitmux =
        if config.${namespace}.cli.multiplexer.tmux.plugins.gitmux.enable then
          "set -agF status-left '#{E:@catppuccin_gitmux_text}'"
        else
          "";
      isLaptop = builtins.elem host laptops;
      battery =
        if isLaptop then
          ''
            set -agF status-right '#{E:@catppuccin_status_battery}'
          ''
        else
          "";
      extraConfig = ''
        # Renaming
        set -wg automatic-rename on
        set -g allow-rename off

        # Empty line before status
        set -Fg 'status-format[1]' '#{status-format[0]}'
        set -g 'status-format[0]' ""
        set -g status 2

        # Catppuccin
        set -g @catppuccin_flavor "mocha"
        set -g @catppuccin_directory_text " #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "

        set -g @catppuccin_window_current_number ""
        set -g @catppuccin_window_current_number_color "#{E:@thm_peach}"
        set -g @catppuccin_window_current_text "#[fg=#{@thm_peach},bg=#{@thm_surface_1}]#I#[fg=#{@thm_surface_1},bg=#{@thm_peach}] #[fg=#{@thm_mantle},bg=#{@thm_peach}]#{?#{!=:#{window_name},}, #W,}"

        set -g @catppuccin_window_number ""
        set -g @catppuccin_window_number_color "#{E:@thm_surface_0}"
        set -g @catppuccin_window_text "#[fg=#{@thm_rosewater},bg=#{@thm_surface_0}] #I#{?#{!=:#{window_name},},  #W,}"

        set -g @catppuccin_window_number_position "right"
        set -g @catppuccin_window_status_style 'rounded'
        set -g @catppuccin_window_flags "icon"

        set -g @catppuccin_status_background '#0C0C0C'
        set -g @catppuccin_status_connect_separator "no"
        set -g @catppuccin_status_left_separator  " "
        set -g @catppuccin_status_right_separator " "

        set -g @catppuccin_pane_status_enabled "yes"
        set -g @catppuccin_pane_border_status "yes"
        set -g @catppuccin_pane_active_border_style "##{?pane_in_mode,fg=#{@thm_peach},##{?pane_synchronized,fg=#{@thm_rosewater},fg=#{@thm_peach}}}"
        set -g @catppuccin_pane_color "#{@thm_rosewater}"

        set -g @catppuccin_date_time_text ' %d.%m.%y '

        # Border status
        setw -g pane-border-status top

        set -g status-position bottom
      '';
    in
    {
      progs.tmux.plugins =
        lib.optional isLaptop pkgs.tmuxPlugins.battery
        ++ lib.optionals (!config.catppuccin.tmux.enable) [
          {
            plugin = pkgs.tmuxPlugins.catppuccin;
            inherit extraConfig;
          }
          {
            plugin = pkgs.${namespace}.tmux-loadavg;
            extraConfig = ''
              # Left status
              set -g status-left-length 100
              set -g status-left "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold] #{E:@catppuccin_status_session}},#{#[bg=#{@thm_bg},fg=#{@thm_blue}] #{E:@catppuccin_status_session}}}"
              ${gitmux}
              ${openpomodoro}

              # Right status
              set -g status-right-length 100
              set -gF status-right '#{E:@catppuccin_status_load}'
              ${battery}
            '';
          }
        ];
      value = {
        catppuccin.tmux.extraConfig = lib.mkIf config.catppuccin.tmux.enable extraConfig;
      };

    }
  )
)
