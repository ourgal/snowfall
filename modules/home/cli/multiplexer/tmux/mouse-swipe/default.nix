args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.tmux.plugins = [ pkgs.${namespace}.tmux-mouse-swipe ];
    }
  )
)
