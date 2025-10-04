args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.tmux.plugins = [ pkgs.tmuxPlugins.copycat ];
    }
  )
)
