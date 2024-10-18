args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        inputs
        lib
        namespace
        ;
      inherit (lib.${namespace}) with';
      aagl = inputs.aagl.packages."${pkgs.system}";
    in
    {
      path = ./.;
      inputPkgs = with' aagl [
        "anime-borb-launcher"
        "anime-game-launcher"
        "honkers-launcher"
        "honkers-railway-launcher"
      ];
    }
  )
)
