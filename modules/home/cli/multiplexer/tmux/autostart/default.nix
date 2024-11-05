args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config sources;
      ln = config.lib.file.mkOutOfStoreSymlink;
    in
    {
      path = ./.;
      progs.fish.plugins = [
        rec {
          name = "tmux.fish";
          src = pkgs.fetchFromGitHub {
            inherit (sources.${name}.src)
              owner
              repo
              rev
              sha256
              ;
          };
        }
      ];
      files.".tmux.conf" = ln "${config.xdg.configHome}/tmux/tmux.conf";
    }
  )
)
