args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.tmux.plugins = [ { plugin = pkgs.${namespace}.tmux-edgelord; } ];
    }
  )
)
