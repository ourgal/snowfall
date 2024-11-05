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
      baseConf = ''
        set -g default-terminal "tmux-256color"
        set -ag terminal-overrides ",xterm-256color:RGB"
        # set -g history-limit 20000
        set -g buffer-limit 20
        set -sg escape-time 0
        set -g display-time 1500
        set -g remain-on-exit off
        set -g repeat-time 300
        setw -g allow-rename off
        setw -g automatic-rename on
        set-option -g automatic-rename-format "#{?#{==:#{pane_current_command},fish},#{b:pane_current_path},#{pane_current_command}}"
        set -g focus-events on
        setw -g aggressive-resize on

        set -gq allow-passthrough on

        set -ga update-environment TERM
        set -ga update-environment TERM_PROGRAM

        # Set parent terminal title to reflect current window in tmux session
        set -g set-titles on
        set -g set-titles-string "#I:#W"

        # Start index of window/pane with 1, because we're humans, not computers
        set -g base-index 1
        setw -g pane-base-index 1

        # Enable mouse support
        set -g mouse on

        set -g status-position top

        # ==========================
        # ===   Key bindings     ===
        # ==========================

        # unbind default key bindings, we're going to override
        unbind "\$" # rename-session
        unbind ,    # rename-window
        unbind %    # split-window -h
        unbind '"'  # split-window
        unbind \}    # swap-pane -D
        unbind \{    # swap-pane -U
        unbind [    # paste-buffer
        unbind ]
        unbind "'"  # select-window
        unbind n    # next-window
        unbind p    # previous-window
        unbind c    # new-window
        unbind l    # last-window
        unbind M-n  # next window with alert
        unbind M-p  # next window with alert
        unbind o    # focus thru panes
        unbind &    # kill-window
        unbind "#"  # list-buffer
        unbind =    # choose-buffer
        # unbind z    # zoom-pane
        unbind M-Up  # resize 5 rows up
        unbind M-Down # resize 5 rows down
        unbind M-Right # resize 5 rows right
        unbind M-Left # resize 5 rows left
        unbind b
        unbind s # choose session
        unbind w # choose window
        unbind . # move window
        unbind i # display window information
        unbind f # search for a pane

        # new window and retain cwd
        bind n new-session
        bind p paste-buffer
        bind-key "c" new-window -c "#{pane_current_path}"

        # Rename session and window
        bind r command-prompt -I "#{window_name}" "rename-window '%%'"
        bind R command-prompt -I "#{session_name}" "rename-session '%%'"

        bind w choose-session
        bind = command-prompt -I "#{move-window}" "move-window '%%'"

        bind-key -r "<" swap-window -d -t -1
        bind-key -r ">" swap-window -d -t +1

        # Split panes
        bind-key "v" split-window -h -c "#{pane_current_path}"
        bind-key "V" split-window -fh -c "#{pane_current_path}"
        bind-key "s" split-window -v -c "#{pane_current_path}"
        bind-key "S" split-window -fv -c "#{pane_current_path}"

        # Kill pane/window/session shortcuts
        bind x kill-window
        bind C-x confirm-before -p "kill other windows? (y/n)" "kill-window -a"
        set -g detach-on-destroy off
        bind X confirm-before -p "kill-session #S? (y/n)" kill-session

        # Detach from session
        bind d detach
        bind D if -F '#{session_many_attached}' \
            'confirm-before -p "Detach other clients? (y/n)" "detach -a"' \
            'display "Session has only 1 client attached"'

        # bind Space if-shell -F '#{==:#{session_name},popup}' {
        #     detach-client
        # } {
        #     popup -d '#{pane_current_path}' -xC -yC -w 80% -h 80% -E "tmux attach -t popup || tmux new -s popup"
        # }

        # ================================================
        # ===     Copy mode, scroll and clipboard      ===
        # ================================================

        set -g @copy_use_osc52_fallback on

        # Prefer vi style key table
        setw -g mode-keys vi

        # trigger copy mode by
        bind b copy-mode
      '';
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
      pluginsBase = with tmuxPlugins; [
        {
          plugin = copycat;
          extraConfig = baseConf;
        }
      ];

      pluginsResurrect = with tmuxPlugins; [
        {
          plugin = resurrect;
          extraConfig = ''
            set -g @resurrect-capture-pane-contents 'on'
            set -g @resurrect-processes 'lazygit newsboat clifm "devbox shell" "hx *" ncmpcpp "~nnn-wrapped->nnn" "~lf->lf" mmtc'
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
        # keep-sorted end
      ];
      progs = [
        {
          tmux = {
            clock24 = true;
            historyLimit = 20000;
            newSession = true;
            baseIndex = 1;
            catppuccin.extraConfig = lib.mkIf config.programs.tmux.catppuccin.enable ''
              # Configure Catppuccin
              set -g @catppuccin_flavor "macchiato"
              set -g @catppuccin_status_background "none"
              set -g @catppuccin_window_status_style "none"
              set -g @catppuccin_pane_status_enabled "off"
              set -g @catppuccin_pane_border_status "off"

              # status left look and feel
              set -g status-left-length 100
              set -g status-left ""
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
            plugins =
              pluginsBase
              ++ (
                if (cfg.theme == "tmux2k") then
                  [ tmux2k ]
                else if (cfg.theme == "dracula") then
                  [ dracula ]
                else if (cfg.theme == "kanagawa") then
                  [ kanagawa ]
                else if (cfg.theme == "minimal") then
                  [ minimal ]
                else if config.programs.tmux.catppuccin.enable then
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
    }
  )
)
