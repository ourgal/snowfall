{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    inputPkgs = with args.inputs.aagl.packages."${args.pkgs.system}"; [
      anime-borb-launcher
      anime-game-launcher
      honkers-launcher
      honkers-railway-launcher
    ];
  }
)
