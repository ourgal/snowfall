{ ... }@args:
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
        toTOML
        ;
      inherit (pkgs) tmuxPlugins fetchFromGitHub;
      cfg = cfgHome config.${namespace} ./.;
      termsand =
        (fetchFromGitHub {
          owner = "ourgal";
          repo = "termsand";
          rev = "75a50ba82ed299047cd5d0cd53b6fce390cfc6e8";
          hash = "sha256-tylzyjg3AJutwnrxjxzshEfuTD14VegCIMb/wroGpj0=";
        })
        + "/sand.sh";
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

        bind E run-shell ${termsand}

        bind t run-shell ${pkgs.${namespace}.tmux-sesh}/bin/tmux-sesh
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
          plugin = copycat;
          extraConfig = baseConf;
        }
        open
        fpp
        tmux-fzf
        {
          plugin = extrakto;
          extraConfig = "set -g @extrakto_key i;";
        }
        fuzzback
        pkgs.${namespace}.tmux-edgelord
        pkgs.${namespace}.tmux-fzf-url
        pkgs.${namespace}.tmux-power-zoom
        pkgs.${namespace}.tmux-auto-renumber-session
        {
          plugin = pkgs.${namespace}.tmux-tome;
          extraConfig = ''
            set -g @tome_key a;
            set -g @tome_scratch-key a;
            set -g @tome_playbook .playbook.fish;
          '';
        }
        {
          plugin = pkgs.${namespace}.tmux-tea;
          extraConfig = ''
            set -g @tea-bind T;
          '';
        }
        jump
        {
          plugin = tmux-thumbs;
          extraConfig = ''
            set -g @thumbs-key .;
          '';
        }
        {
          plugin = pkgs.${namespace}.tmux-which-key;
          extraConfig = ''
            set -g @tmux-which-key-xdg-enable 1;
          '';
        }
        {
          plugin = session-wizard;
          extraConfig = "set -g @session-wizard 'k'";
        }
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

      gitmuxConf = builtins.toJSON {
        tmux = {
          symbols = {
            branch = "⎇ ";
            hashprefix = ":";
            ahead = "↑·";
            behind = "↓·";
            staged = "● ";
            conflict = "✖ ";
            modified = "✚ ";
            untracked = "… ";
            stashed = "⚑ ";
            insertions = "Σ";
            deletions = "Δ";
            clean = "✔";
          };
          styles = {
            clear = "#[none]";
            state = "#[fg=red,bold]";
            branch = "#[fg=white,bold]";
            remote = "#[fg=cyan]";
            divergence = "#[fg=yellow]";
            staged = "#[fg=green,bold]";
            conflict = "#[fg=red,bold]";
            modified = "#[fg=red,bold]";
            untracked = "#[fg=magenta,bold]";
            stashed = "#[fg=cyan,bold]";
            insertions = "#[fg=green]";
            deletions = "#[fg=red]";
            clean = "#[fg=green,bold]";
          };
          layout = [
            "branch"
            "divergence"
            " - "
            "flags"
          ];
          options = {
            branch_max_len = 0;
            branch_trim = "right";
            ellipsis = "…";
            hide_clean = false;
            swap_divergence = false;
          };
        };
      };
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "gitmux"
        "sesh"
        "smug"
        "tmuxinator"
        "tmuxp"
        # keep-sorted end
      ];
      myPkgs = [
        # keep-sorted start
        "fzfp"
        "termsand"
        # keep-sorted end
      ];
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
          ".gitmux.conf".text = gitmuxConf;
        };
        xdg.configFile = {
          "gitmux/config.yaml".text = gitmuxConf;
          "sesh/sesh.toml".text = toTOML {
            default_session = {
              startup_command = "tmuxinator local";
            };
          };
          "tmux/plugins/tmux-which-key/config.yaml".text = builtins.toJSON {
            command_alias_start_index = 200;
            keybindings = {
              prefix_table = "Space";
              # root_table = "C-Space";
            };
            title = {
              style = "align=centre,bold";
              prefix = "tmux";
              prefix_style = "fg=green,align=centre,bold";
            };
            position = {
              x = "C";
              y = "C";
            };
            custom_variables = [
              {
                name = "log_info";
                value = "#[fg=green,italics] [info]#[default]#[italics]";
              }
            ];
            macros = [
              {
                name = "reload-config";
                commands = [
                  "display \"#{log_info} Loading config... \""
                  "source-file $HOME/.config/tmux/tmux.conf"
                  "display -p \"\\n\\n... Press ENTER to continue\""
                ];
              }
              {
                name = "restart-pane";
                commands = [
                  "display \"#{log_info} Restarting pane\""
                  "respawnp -k -c #{pane_current_path}"
                ];
              }
            ];
            items = [
              {
                name = "Run";
                key = "space";
                command = "command-prompt";
              }
              {
                name = "Last window";
                key = "tab";
                command = "last-window";
              }
              {
                name = "Last pane";
                key = "`";
                command = "last-pane";
              }
              { separator = true; }
              {
                name = "+Windows";
                key = "w";
                menu = [
                  {
                    name = "Last";
                    key = "tab";
                    command = "last-window";
                  }
                  {
                    name = "Choose";
                    key = "w";
                    command = "choose-tree -Zw";
                  }
                  {
                    name = "Previous";
                    key = "p";
                    command = "previous-window";
                  }
                  {
                    name = "Next";
                    key = "n";
                    command = "next-window";
                  }
                  {
                    name = "New";
                    key = "c";
                    command = "neww -c #{pane_current_path}";
                  }
                  { separator = true; }
                  {
                    name = "+Layout";
                    key = "l";
                    menu = [
                      {
                        name = "Next";
                        key = "l";
                        command = "nextl";
                        transient = true;
                      }
                      {
                        name = "Tiled";
                        key = "t";
                        command = "selectl tiled";
                      }
                      {
                        name = "Horizontal";
                        key = "h";
                        command = "selectl even-horizontal";
                      }
                      {
                        name = "Vertical";
                        key = "v";
                        command = "selectl even-vertical";
                      }
                      {
                        name = "Horizontal main";
                        key = "H";
                        command = "selectl main-horizontal";
                      }
                      {
                        name = "Vertical main";
                        key = "V";
                        command = "selectl main-vertical";
                      }
                    ];
                  }
                  {
                    name = "Split horizontal";
                    key = "s";
                    command = "splitw -h -c #{pane_current_path}";
                  }
                  {
                    name = "Split vertical";
                    key = "v";
                    command = "splitw -v -c #{pane_current_path}";
                  }
                  {
                    name = "Rotate";
                    key = "o";
                    command = "rotatew";
                    transient = true;
                  }
                  {
                    name = "Rotate reverse";
                    key = "O";
                    command = "rotatew -D";
                    transient = true;
                  }
                  { separator = true; }
                  {
                    name = "Rename";
                    key = "r";
                    command = "command-prompt -I \"#W\" \"renamew -- \\\"%%\\\"\"";
                  }
                  {
                    name = "Kill";
                    key = "x";
                    command = "confirm -p \"Kill window #W? (y/n)\" killw";
                  }
                ];
              }
              {
                name = "+Panes";
                key = "p";
                menu = [
                  {
                    name = "Last";
                    key = "tab";
                    command = "lastp";
                  }
                  {
                    name = "Choose";
                    key = "p";
                    command = "displayp -d 0";
                  }
                  { separator = true; }
                  {
                    name = "Left";
                    key = "h";
                    command = "selectp -L";
                  }
                  {
                    name = "Down";
                    key = "j";
                    command = "selectp -D";
                  }
                  {
                    name = "Up";
                    key = "k";
                    command = "selectp -U";
                  }
                  {
                    name = "Right";
                    key = "l";
                    command = "selectp -R";
                  }
                  { separator = true; }
                  {
                    name = "Zoom";
                    key = "z";
                    command = "resizep -Z";
                  }
                  {
                    name = "+Resize";
                    key = "r";
                    menu = [
                      {
                        name = "Left";
                        key = "h";
                        command = "resizep -L";
                        transient = true;
                      }
                      {
                        name = "Down";
                        key = "j";
                        command = "resizep -D";
                        transient = true;
                      }
                      {
                        name = "Up";
                        key = "k";
                        command = "resizep -U";
                        transient = true;
                      }
                      {
                        name = "Right";
                        key = "l";
                        command = "resizep -R";
                        transient = true;
                      }
                      {
                        name = "Left more";
                        key = "H";
                        command = "resizep -L 10";
                        transient = true;
                      }
                      {
                        name = "Down more";
                        key = "J";
                        command = "resizep -D 10";
                        transient = true;
                      }
                      {
                        name = "Up more";
                        key = "K";
                        command = "resizep -U 10";
                        transient = true;
                      }
                      {
                        name = "Right more";
                        key = "L";
                        command = "resizep -R 10";
                        transient = true;
                      }
                    ];
                  }
                  {
                    name = "Swap left";
                    key = "H";
                    command = "swapp -t \"{left-of}\"";
                  }
                  {
                    name = "Swap down";
                    key = "J";
                    command = "swapp -t \"{down-of}\"";
                  }
                  {
                    name = "Swap up";
                    key = "K";
                    command = "swapp -t \"{up-of}\"";
                  }
                  {
                    name = "Swap right";
                    key = "L";
                    command = "swapp -t \"{right-of}\"";
                  }
                  {
                    name = "Break";
                    key = "!";
                    command = "break-pane";
                  }
                  { separator = true; }
                  {
                    name = "Mark";
                    key = "m";
                    command = "selectp -m";
                  }
                  {
                    name = "Unmark";
                    key = "M";
                    command = "selectp -M";
                  }
                  {
                    name = "Capture";
                    key = "C";
                    command = "capture-pane";
                  }
                  {
                    name = "Respawn pane";
                    key = "R";
                    macro = "restart-pane";
                  }
                  {
                    name = "Kill";
                    key = "X";
                    command = "confirm -p \"Kill pane #P? (y/n)\" killp";
                  }
                ];
              }
              {
                name = "+Buffers";
                key = "b";
                menu = [
                  {
                    name = "Choose";
                    key = "b";
                    command = "choose-buffer -Z";
                  }
                  {
                    name = "List";
                    key = "l";
                    command = "lsb";
                  }
                  {
                    name = "Paste";
                    key = "p";
                    command = "pasteb";
                  }
                ];
              }
              {
                name = "+Sessions";
                key = "s";
                menu = [
                  {
                    name = "Choose";
                    key = "s";
                    command = "choose-tree -Zs";
                  }
                  {
                    name = "New";
                    key = "n";
                    command = "new";
                  }
                  {
                    name = "Rename";
                    key = "r";
                    command = "rename";
                  }
                ];
              }
              {
                name = "+Client";
                key = "c";
                menu = [
                  {
                    name = "Choose";
                    key = "c";
                    command = "choose-client -Z";
                  }
                  {
                    name = "Last";
                    key = "l";
                    command = "switchc -l";
                  }
                  {
                    name = "Previous";
                    key = "p";
                    command = "switchc -p";
                  }
                  {
                    name = "Next";
                    key = "n";
                    command = "switchc -n";
                  }
                  { separator = true; }
                  {
                    name = "Refresh";
                    key = "R";
                    command = "refresh";
                  }
                  {
                    name = "Detach";
                    key = "D";
                    command = "detach";
                  }
                  {
                    name = "Suspend";
                    key = "Z";
                    command = "suspendc";
                  }
                  { separator = true; }
                  {
                    name = "Reload config";
                    key = "r";
                    macro = "reload-config";
                  }
                  {
                    name = "Customize";
                    key = ",";
                    command = "customize-mode -Z";
                  }
                ];
              }
              {
                name = "+Extensions";
                key = "e";
                menu = [
                  {
                    name = "Copycat Search";
                    key = "/";
                    command = "run-shell ${pkgs.tmuxPlugins.copycat}/share/tmux-plugins/copycat/scripts/copycat_search.sh";
                  }
                  {
                    name = "Copycat File Search";
                    key = "C-f";
                    command = ''run-shell ${pkgs.tmuxPlugins.copycat}/share/tmux-plugins/copycat/scripts/copycat_mode_start.sh "(^|^\.|[[:space:]]|[[:space:]]\.|[[:space:]]\.\.|^\.\.)[[:alnum:]~_-]*/[][[:alnum:]_.#$%&+=/@-]*"'';
                  }
                  {
                    name = "Copycat Git Status Files";
                    key = "C-g";
                    command = ''run-shell ${pkgs.tmuxPlugins.copycat}/share/tmux-plugins/copycat/scripts/copycat_git_special.sh #{pane_current_path}'';
                  }
                  {
                    name = "Copycat Hash Search";
                    key = "M-h";
                    command = ''run-shell ${pkgs.tmuxPlugins.copycat}/share/tmux-plugins/copycat/scripts/copycat_mode_start.sh "\b([0-9a-f]{7,40}|[[:alnum:]]{52}|[0-9a-f]{64})\b"'';
                  }
                  {
                    name = "Copycat Url Search";
                    key = "C-u";
                    command = ''run-shell ${pkgs.tmuxPlugins.copycat}/share/tmux-plugins/copycat/scripts/copycat_mode_start.sh "(https?://|git@|git://|ssh://|ftp://|file:///)[[:alnum:]?=%/_.:,;~@!#$&()*+-]*"'';
                  }
                  {
                    name = "Copycat Digit Search";
                    key = "C-d";
                    command = ''run-shell ${pkgs.tmuxPlugins.copycat}/share/tmux-plugins/copycat/scripts/copycat_mode_start.sh "[[:digit:]]+"'';
                  }
                  {
                    name = "Copycat IP Search";
                    key = "M-i";
                    command = ''run-shell ${pkgs.tmuxPlugins.copycat}/share/tmux-plugins/copycat/scripts/copycat_mode_start.sh "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}"'';
                  }
                  { separator = true; }
                  {
                    name = "Session Wizard";
                    key = "k";
                    command = ''display-popup -w "80"% -h "40"% -E ${pkgs.tmuxPlugins.session-wizard}/share/tmux-plugins/session-wizard/session-wizard.sh'';
                  }
                  { separator = true; }
                  {
                    name = "Tmux Fzf";
                    key = "F";
                    command = ''run-shell -b ${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/main.sh'';
                  }
                  { separator = true; }
                  {
                    name = "Extrakto";
                    key = "i";
                    command = ''run-shell ${pkgs.tmuxPlugins.extrakto}/share/tmux-plugins/extrakto/scripts/helpers.sh #{pane_id}'';
                  }
                  { separator = true; }
                  {
                    name = "Fuzzback";
                    key = "?";
                    command = ''run-shell -b ${pkgs.tmuxPlugins.fuzzback}/share/tmux-plugins/extrakto/scripts/fuzzback.sh'';
                  }
                  { separator = true; }
                  {
                    name = "Thumbs";
                    key = ".";
                    command = ''run-shell -b ${pkgs.tmuxPlugins.tmux-thumbs}/share/tmux-plugins/tmux-thumbs/tmux-thumbs.sh'';
                  }
                  { separator = true; }
                  {
                    name = "Fzf Url";
                    key = "u";
                    command = ''run-shell -b ${pkgs.${namespace}.tmux-fzf-url}/share/tmux-plugins/tmux-fzf-url/fzf-url.sh "" "screen" ""'';
                  }
                  { separator = true; }
                  {
                    name = "Jump";
                    key = "j";
                    command = ''run-shell -b ${pkgs.tmuxPlugins.jump}/share/tmux-plugins/jump/scripts/tmux-jump.sh'';
                  }
                  { separator = true; }
                  {
                    name = "Termsand";
                    key = "E";
                    command = "run-shell ${termsand}";
                  }
                  { separator = true; }
                  {
                    name = "Tea";
                    key = "T";
                    command = ''run-shell -b ${pkgs.${namespace}.tmux-tea}/share/tmux-plugins/tmux-tea/bin/tea.sh'';
                  }
                  { separator = true; }
                  {
                    name = "Fpp";
                    key = "f";
                    command = ''run-shell -b ${pkgs.tmuxPlugins.fpp}/share/tmux-plugins/fpp/scripts/fpp.tmux'';
                  }
                  { separator = true; }
                  {
                    name = "Zoom";
                    key = "Z";
                    command = ''run-shell -b ${
                      pkgs.${namespace}.tmux-power-zoom
                    }/share/tmux-plugins/tmux-power-zoom/scripts/power_zoom.sh'';
                  }
                  { separator = true; }
                  {
                    name = "Tome Playbook";
                    key = "a";
                    command = ''run-shell -b ${pkgs.${namespace}.tmux-tome}/share/tmux-plugins/tmux-tome/tome-open-playbook'';
                  }
                  {
                    name = "Tome Scratch Playbook";
                    key = "A";
                    command = ''run-shell -b ${pkgs.${namespace}.tmux-tome}/share/tmux-plugins/tmux-tome/tome-open-playbook -s'';
                  }
                  { separator = true; }
                  {
                    name = "Sesh";
                    key = "t";
                    command = "run-shell -b ${pkgs.${namespace}.tmux-sesh}/bin/tmux-sesh";
                  }
                ];
              }
              { separator = true; }
              {
                name = "Time";
                key = "T";
                command = "clock-mode";
              }
              {
                name = "Show messages";
                key = "~";
                command = "show-messages";
              }
              {
                name = "+Keys";
                key = "?";
                command = "list-keys -N";
              }
            ];
          };
        };
        ${namespace}.dev.python.global.pkgs = [ "pyyaml" ];
      };
      extraOpts = {
        autostart = switch;
        resurrect = switch;
        transient = switch;
        theme = mkOpt' themeType "";
      };
    }
  )
)
