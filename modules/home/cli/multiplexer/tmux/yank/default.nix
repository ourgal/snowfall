args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs.tmux.plugins = [
        {
          plugin = pkgs.tmuxPlugins.yank;
          extraConfig = "set -g @yank_action 'copy-pipe'";
        }
      ];
    }
  )
)
