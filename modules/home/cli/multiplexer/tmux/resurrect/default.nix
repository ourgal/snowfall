args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        config
        namespace
        lib
        ;
      pluginsResurrect = [
        {
          plugin = pkgs.tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-capture-pane-contents 'on'
            set -g @resurrect-processes 'lazygit newsboat clifm "devbox shell" "hx *" ncmpcpp "~nnn-wrapped->nnn" lf rmpc "~ranger->ranger-cd" "yazi->yy"'
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
      progs.tmux = {
        plugins = lib.mkAfter pluginsResurrect;
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
