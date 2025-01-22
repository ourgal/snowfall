args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      inputPkgs = p: [ p.ghostty.packages."${pkgs.system}".default ];
      confs.ghostty = ./config;
    }
  )
)
