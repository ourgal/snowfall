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
        ;
      inherit (pkgs) tmuxPlugins;
      cfg = cfgHome config.${namespace} ./.;

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
            plugins = if cfg.resurrect.enable then pluginsResurrect else [ ];
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
