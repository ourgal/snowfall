args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs.tmux.plugins = [ pkgs.${namespace}.tmux-auto-renumber-session ];
    }
  )
)
