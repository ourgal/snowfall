args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.tmux.plugins = [
        {
          plugin = pkgs.${namespace}.tmux-ssh-split;
          extraConfig = ''
            set-option -g @ssh-split-keep-cwd "true"
            set-option -g @ssh-split-keep-remote-cwd "true"
            set-option -g @ssh-split-fail "false"
            set-option -g @ssh-split-no-env "false"
            set-option -g @ssh-split-no-shell "false"
            set-option -g @ssh-split-strip-cmd "true"
            set-option -g @ssh-split-verbose "true"
            set-option -g @ssh-split-debug "false"
            set-option -g @ssh-split-h-key "v"
            set-option -g @ssh-split-v-key "s"
            set-option -g @ssh-split-w-key "c"
          '';
        }
      ];
    }
  )
)
