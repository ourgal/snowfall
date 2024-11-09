args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs.tmux.plugins = [ pkgs.tmuxPlugins.copycat ];
    }
  )
)
