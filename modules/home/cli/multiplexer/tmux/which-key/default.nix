args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        namespace
        config
        lib
        ;
      inherit (config.${namespace}.cli.multiplexer.tmux)
        sesh
        tome
        power-zoom
        fpp
        tea
        termsand
        jump
        fzf-url
        thumbs
        fuzzback
        extrakto
        fzf
        session-wizard
        floax
        buoyshell
        ;
    in
    {
      path = ./.;
      progs.tmux.plugins = [
        {
          plugin = pkgs.${namespace}.tmux-which-key;
          extraConfig = ''
            set -g @tmux-which-key-xdg-enable 1;
          '';
        }
      ];
      confs = {
        "tmux/plugins/tmux-which-key/config.yaml" = {
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
              menu =
                [
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
                ]
                ++ lib.optional session-wizard.enable {
                  name = "Session Wizard";
                  inherit (session-wizard) key command;
                }
                ++ lib.optional fzf.enable {
                  name = "Tmux Fzf";
                  inherit (fzf) key command;
                }
                ++ lib.optional extrakto.enable {
                  name = "Extrakto";
                  inherit (extrakto) key command;
                }
                ++ lib.optional fuzzback.enable {
                  name = "Fuzzback";
                  inherit (fuzzback) key command;
                }
                ++ lib.optional thumbs.enable {
                  name = "Thumbs";
                  inherit (thumbs) key command;
                }
                ++ lib.optional fzf-url.enable {
                  name = "Fzf Url";
                  inherit (fzf-url) key command;
                }
                ++ lib.optional jump.enable {
                  name = "Jump";
                  inherit (jump) key command;
                }
                ++ lib.optional termsand.enable {
                  name = "Termsand";
                  inherit (termsand) key command;
                }
                ++ lib.optional tea.enable {
                  name = "Tea";
                  inherit (tea) key command;
                }
                ++ lib.optional fpp.enable {
                  name = "Fpp";
                  inherit (fpp) key command;
                }
                ++ lib.optional power-zoom.enable {
                  name = "Zoom";
                  inherit (power-zoom) key command;
                }
                ++ lib.optional tome.enable {
                  name = "Tome Playbook";
                  inherit (tome) key command;
                }
                ++ lib.optional sesh.enable {
                  name = "Sesh";
                  inherit (sesh) key command;
                }
                ++ lib.optional floax.enable {
                  name = "Floax";
                  inherit (floax) key command;
                }
                ++ lib.optional buoyshell.enable {
                  name = "Buoyshell";
                  inherit (buoyshell) key command;
                };
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
    }
  )
)
