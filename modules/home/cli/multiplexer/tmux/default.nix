args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        cfgHome
        config
        namespace
        lib
        switch
        mkOpt'
        host
        ;
      inherit (pkgs) tmuxPlugins;
      inherit (lib.${namespace}.settings) laptops;
      cfg = cfgHome config.${namespace} ./.;
      themeType = lib.types.enum [
        "tmux2k"
        "dracula"
        "kanagawa"
        "minimal"
        ""
      ];
      dracula = {
        plugin = tmuxPlugins.dracula;
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
      };
      tmux2k = {
        plugin = pkgs.${namespace}.tmux2k;
        extraConfig = ''
          set -g @tmux2k-left-plugins "cpu-usage ram-usage"
          set -g @tmux2k-show-left-icon "session"
        '';
      };
      kanagawa = {
        plugin = pkgs.${namespace}.kanagawaPlugin;
      };
      minimal = {
        plugin = pkgs.${namespace}.minimal-tmux-status;
        extraConfig = ''
          set -g @minimal-tmux-justify "left"
          set -g @minimal-tmux-status "top"
        '';
      };

      pluginsResurrect = with tmuxPlugins; [
        {
          plugin = resurrect;
          extraConfig = ''
            set -g @resurrect-capture-pane-contents 'on'
            set -g @resurrect-processes 'lazygit newsboat clifm "devbox shell" "hx *" ncmpcpp "~nnn-wrapped->nnn" "~lf->lf" rmpc "~ranger->ranger-cd" "yazi->yy"'
          '';
        }
        {
          plugin = pkgs.${namespace}.tmux-continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-boot 'on'
            set -g @continuum-save-interval '10'
          '';
        }
      ];

      openpomodoro =
        if config.${namespace}.cli.time-tracking.openpomodoro-cli.enable then
          "set -ga status-left '#[bg=#(pomodoro tmux-color)]🍅'"
        else
          "";
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "smug"
        "tmuxinator"
        "tmuxp"
        # keep-sorted end
      ];
      myPkgs = [
        # keep-sorted start
        "fzfp"
        "git-mux"
        # keep-sorted end
      ];
      progs = [
        {
          tmux = {
            shell = "${pkgs.fish}/bin/fish";
            clock24 = true;
            historyLimit = 20000;
            newSession = true;
            baseIndex = 1;
            sensibleOnTop = true;
            plugins =
              (
                if (cfg.theme == "tmux2k") then
                  [ tmux2k ]
                else if (cfg.theme == "dracula") then
                  [ dracula ]
                else if (cfg.theme == "kanagawa") then
                  [ kanagawa ]
                else if (cfg.theme == "minimal") then
                  [ minimal ]
                else if config.catppuccin.tmux.enable then
                  [
                    pkgs.${namespace}.tmux-loadavg
                    tmuxPlugins.battery
                  ]
                else
                  [ ]
              )
              ++ (if cfg.resurrect.enable then pluginsResurrect else [ ]);
          };
        }
        {
          fish = {
            interactiveShellInit =
              lib.mkIf cfg.resurrect.enable # fish
                ''
                  if command -v tmux >/dev/null 2>&1; and \
                      test -z "$TMUX"; and \
                      test -z $INSIDE_EMACS; and \
                      test -z $VIM; and \
                      test -z $VSCODE_RESOLVING_ENVIRONMENT; and \
                      test "$TERM_PROGRAM" != 'vscode'; and \
                      ! fish_is_root_user
                      exec tmux a
                  end
                '';
            functions.cdb = {
              body = ''
                set dir (${pkgs.${namespace}.find-buffer-path})
                if test -n $dir
                   cd $dir
                end
              '';
              description = "cd buffer path";
            };
          };
        }
      ];
      enable = [
        # keep-sorted start
        "auto-renumber-session"
        "copycat"
        "edgelord"
        "extrakto"
        "fpp"
        "fuzzback"
        "fzf"
        "fzf-url"
        "gitmux"
        "jump"
        "open"
        "power-zoom"
        "sesh"
        "session-wizard"
        "tea"
        "termsand"
        "thumbs"
        "tome"
        "which-key"
        "yank"
        # keep-sorted end
      ];
      extraOpts = {
        resurrect = switch;
        theme = mkOpt' themeType "";
      };
      value.catppuccin.tmux.extraConfig = lib.mkIf config.catppuccin.tmux.enable ''
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
    }
  )
)
