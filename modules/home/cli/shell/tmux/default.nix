{ ... }@args:
args.module (
  args
  // (
    with args;
    let
      inherit (pkgs) tmuxPlugins fetchFromGitHub;
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

        # new window and retain cwd
        bind n new-session
        bind p paste-buffer

        # Rename session and window
        bind r command-prompt -I "#{window_name}" "rename-window '%%'"
        bind R command-prompt -I "#{session_name}" "rename-session '%%'"

        # Split panes
        # bind | split-window -h -c "#{pane_current_path}"
        # bind _ split-window -v -c "#{pane_current_path}"

        # Kill pane/window/session shortcuts
        bind x kill-window
        bind C-x confirm-before -p "kill other windows? (y/n)" "kill-window -a"
        bind Q confirm-before -p "kill-session #S? (y/n)" kill-session

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
      ln = config.lib.file.mkOutOfStoreSymlink;
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
      transient = {
        plugin = pkgs.${namespace}.tmux-transient-status;
      };
      pluginsBase = with tmuxPlugins; [
        {
          plugin = pain-control;
          extraConfig = baseConf;
        }
        copycat
        open
        tmux-fzf
        extrakto
        fuzzback
        pkgs.${namespace}.tmux-edgelord
        jump
        tmux-thumbs
        {
          plugin = session-wizard;
          extraConfig = "set -g @session-wizard 'k'";
        }
        sessionist
        {
          plugin = yank;
          extraConfig = "set -g @yank_action 'copy-pipe'";
        }
      ];

      pluginsResurrect = with tmuxPlugins; [
        {
          plugin = resurrect;
          extraConfig = ''
            set -g @resurrect-capture-pane-contents 'on'
            set -g @resurrect-processes 'lazygit newsboat clifm "devbox shell" "hx *" ncmpcpp "~nnn-wrapped->nnn" "~lf->lf"'
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
      nixPkgs = "gitmux";
      myPkgs = "fzfp";
      progs = [
        {
          tmux = {
            clock24 = true;
            historyLimit = 20000;
            newSession = true;
            baseIndex = 1;
            catppuccin.extraConfig = lib.mkIf (config.catppuccin.enable == true) ''
              set -g @catppuccin_window_left_separator ""
              set -g @catppuccin_window_right_separator " "
              set -g @catppuccin_window_middle_separator " █"
              set -g @catppuccin_window_number_position "right"

              set -g @catppuccin_window_default_fill "number"
              set -g @catppuccin_window_default_text "#W"

              set -g @catppuccin_window_current_fill "number"
              set -g @catppuccin_window_current_text "#W"
              set -g @catppuccin_window_current_text "#{?#{==:#{pane_current_command},fish},#{b:pane_current_path},#{pane_current_command}}"

              set -g @catppuccin_status_modules_right "load battery"
              set -g @catppuccin_status_modules_left "session gitmux"
              set -g @catppuccin_status_justify "absolute-centre"
              set -g @catppuccin_status_left_separator  " "
              set -g @catppuccin_status_right_separator ""
              set -g @catppuccin_status_fill "icon"
              set -g @catppuccin_status_connect_separator "no"
              set -g @catppuccin_gitmux_text "#(gitmux -cfg $HOME/.config/gitmux/config.yaml \"#{pane_current_path}\")"
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
                else if (config.catppuccin.enable == true) then
                  [
                    pkgs.${namespace}.tmux-loadavg
                    tmuxPlugins.battery
                  ]
                else
                  [ ]
              )
              ++ (if (cfg.transient.enable) then [ transient ] else [ ])
              ++ (if cfg.resurrect.enable then pluginsResurrect else [ ]);
          };
        }
        {
          fish = {
            plugins = lib.mkIf cfg.autostart.enable [
              {
                name = "tmux.fish";
                src = fetchFromGitHub {
                  owner = "budimanjojo";
                  repo = "tmux.fish";
                  rev = "f36b077b2d5ebd577240679cd0adf5cff11380b4";
                  sha256 = "0i1pngs2sa5qczxl0dd1b33i4l3qfixpqisx50g63d5wx4yihbxd";
                };
              }
            ];
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
          };
        }
      ];
      value = {
        home.file = lib.mkIf cfg.autostart.enable {
          ".tmux.conf".source = ln "${config.home.homeDirectory}/.config/tmux/tmux.conf";
          ".gitmux.conf".source = ./gitmux.yaml;
        };
        xdg.configFile = {
          "gitmux/config.yaml".source = ./gitmux.yaml;
        };
      };
      extraOpts = with lib.${namespace}; {
        autostart = switch;
        resurrect = switch;
        transient = switch;
        theme = mkOpt' themeType "";
      };
    }
  )
)
