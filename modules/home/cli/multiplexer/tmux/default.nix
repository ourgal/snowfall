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
      progs.tmux = {
        plugins = if cfg.resurrect.enable then pluginsResurrect else [ ];
      };
      enable = [
        # keep-sorted start
        "plugins"
        "base"
        "scripts"
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
