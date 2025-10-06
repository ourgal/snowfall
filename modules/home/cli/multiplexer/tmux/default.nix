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
        ;
      inherit (pkgs) tmuxPlugins;
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

      pluginsResurrect = [
        {
          plugin = tmuxPlugins.resurrect;
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
    in
    {
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
        "plugins"
        "themes"
        # keep-sorted end
      ];
      extraOpts = {
        resurrect = switch;
        theme = mkOpt' themeType "";
      };
      value = {
        home.file.".tmux/resurrect/fixSymlink".source = pkgs.writeShellScript "fixSymlink" ''
          last=$(find ${config.home.homeDirectory}/.tmux/resurrect/ -type f -name "*.txt" -printf "%T@ %p\n" | sort -n | tail -1 | cut -d' ' -f2-)
          ln -sf $last ${config.home.homeDirectory}/.tmux/resurrect/last
        '';
      };
    }
  )
)
