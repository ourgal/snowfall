args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      inputPkgs = (
        p: with p.aagl.packages."${pkgs.system}"; [
          anime-borb-launcher
          anime-game-launcher
          honkers-launcher
          honkers-railway-launcher
        ]
      );
    }
  )
)
