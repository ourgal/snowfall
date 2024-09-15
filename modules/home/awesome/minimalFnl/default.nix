{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib config;
    in
    {
      path = ./.;
      value = {
        home.activation.aweome_minimalFnl = config.lib.dag.entryAfter [ "chezmoi" ] ''
          PATH=$PATH:${
            lib.makeBinPath [
              pkgs.gnumake
              pkgs.fennel
            ]
          }
          make -C ${config.xdg.configHome}/awesome
        '';
      };
    }
  )
)
