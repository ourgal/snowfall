args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config;
      ln = config.lib.file.mkOutOfStoreSymlink;
    in
    {
      path = ./.;
      progs.fish.plugins = [
        rec {
          name = "tmux.fish";
          inherit (pkgs._sources.${name}) src;
        }
      ];
      files.".tmux.conf" = ln "${config.xdg.configHome}/tmux/tmux.conf";
    }
  )
)
